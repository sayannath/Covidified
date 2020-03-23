import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covidified/weather/weather.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseUser user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isSignedIn = false;

  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'error';
        cityName = '';
        return;
      }
      temperature = weatherData['main']['temp'];
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
    });
  }

  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser();
    var weatherData = await weather.getLocationWeather();
    updateUI(weatherData);

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isSignedIn = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.getUser();
    // var weatherData = await weather.getLocationWeather();
    // updateUI(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff181818),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xff181818),
      body: !isSignedIn
          ? Center(child: CircularProgressIndicator(backgroundColor: Color(0xffFFD818),))
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Hi ${user.displayName}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFFD818),
                              fontFamily: "Roboto",
                              fontSize: 30),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          "$temperature °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Hope doing well",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "$cityName",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
