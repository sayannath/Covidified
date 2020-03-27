import 'package:covidified/bot/google_assistant.dart';
import 'package:covidified/newPage.dart';
import 'package:covidified/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covidified/weather/weather.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseUser user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isSignedIn = false;
  int _selectedIndex = 0;

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

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Bot',
      style: optionStyle,
    ),
    Text(
      'Index 2: News',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

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
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Color(0xffFFD818),
            ))
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Color(0xff181818), boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Color(0xff181818),
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Color(0xffFFD818),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    iconColor: Color(0xffFFD818),
                    text: 'Home',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return HomePage();
                      }));
                    },
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Bot',
                    iconColor: Color(0xffFFD818),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return GoogleAssistant();
                      }));
                    },
                  ),
                  GButton(
                    icon: LineIcons.newspaper_o,
                    text: 'News',
                    iconColor: Color(0xffFFD818),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NewsPage();
                      }));
                    },
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                    iconColor: Color(0xffFFD818),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProfilePage();
                      }));
                    },
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Center(
          child: Image.asset(
            "assets/images/assistant.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
