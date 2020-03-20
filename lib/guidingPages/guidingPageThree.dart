import 'package:covidified/guidingPages/guidingPageFour.dart';
import 'package:covidified/guidingPages/guidingPageTwo.dart';
import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
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
                      "assets/images/guidingThree.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 98,
                    child: Image.asset(
                      "assets/images/mask-group-1.png",
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
                "The app also reminds you to wear mask while you are stepping outside of the house.",
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
                        return PageTwo();
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
                        return PageFour();
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
