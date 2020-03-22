import 'package:covidified/guidingPages/guidingPageOne.dart';
import 'package:covidified/guidingPages/guidingPageThree.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}



class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            Container(
              width: 223,
              height: 224,
              margin: EdgeInsets.only(top: 123),
              child: Image.asset(
                "assets/images/guidingTwo.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 236,
              margin: EdgeInsets.only(top: 41),
              child: Text(
                "Set alarm with the help of this app to let the app remind you to sanitise or wash your hands with soap. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffF6F6F4),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) {
                        return PageOne();
                      }));
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  margin: EdgeInsets.only(right: 25),
                  decoration: BoxDecoration(
                    color: Color(0xffFFD818),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    color: Color(0xffF6F6F4),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) {
                        return PageThree();
                      }));
                    },
                    icon: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
