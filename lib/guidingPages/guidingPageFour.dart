import 'package:covidified/guidingPages/guidingPageFive.dart';
import 'package:covidified/guidingPages/guidingPageThree.dart';
import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/images/xd.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 90,
                    child: Image.asset(
                      "assets/images/f.png",
                      fit: BoxFit.none,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 236,
              margin: EdgeInsets.only(top: 41),
              child: Text(
                "The app warns you if you are in a crowded place and let you notify to evacuate the place for your safety.",
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
                            return PageThree();
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
                            return PageFive();
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
