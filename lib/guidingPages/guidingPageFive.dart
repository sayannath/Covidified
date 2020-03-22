import 'package:covidified/alarmPage.dart';
import 'package:covidified/guidingPages/guidingPageFour.dart';
import 'package:flutter/material.dart';

class PageFive extends StatefulWidget {
  @override
  _PageFiveState createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            Container(
              width: 217,
              height: 212,
              margin: EdgeInsets.only(top: 117),
              child: Image.asset(
                "assets/images/guidingFive.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 236,
              margin: EdgeInsets.only(top: 41),
              child: Text(
                "The app comes with Google Assistant Integration where you can ask questions about the corona virus outbreak.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffF6F6F4),
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
                            return PageFour();
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
                            return AlarmPage();
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
