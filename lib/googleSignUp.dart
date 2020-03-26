import 'package:covidified/loadingPage.dart';
import 'package:covidified/values.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final kFirebaseAnalytics = FirebaseAnalytics();

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseUser _user;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then(
          (user) => setState(() => this._user = user),
        );
  }

  // Sign in with Google.
  Future<FirebaseUser> _googleSignIn() async {
    final curUser = this._user ?? await FirebaseAuth.instance.currentUser();
    if (curUser != null && !curUser.isAnonymous) {
      return curUser;
    }
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    kFirebaseAnalytics.logLogin();
    setState(() => this._user = user);
    return user;
  }

  void _showUserProfilePage(FirebaseUser user) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return LoadingPage();
    }));
  }

  // void _showAlarmSetting(FirebaseUser user) {
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
  //     return PageOne();
  //   }));
  // }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Color(0xffFFD818),
      onPressed: this._busy
          ? null
          : () async {
              setState(() => this._busy = true);
              final user = await this._googleSignIn();
              this._showUserProfilePage(user);
              setState(() => this._busy = false);
            },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Color(0xffFFD818)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/googleLogo.png"),
                height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 22, top: 150),
              child: Text(
                "Welcome to \nUnCovidify",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.accentText,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 52,
                  height: 1.19231,
                ),
              ),
            ),
            Container(
              width: 259,
              margin: EdgeInsets.only(left: 23, top: 30),
              child: Opacity(
                opacity: 0.78307,
                child: Text(
                  "A personalise app to help you stay safe from corona outbreak.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            //Spacer(),
            SizedBox(
              height: 80,
            ),
            Center(child: _signInButton()),
            SizedBox(
              height: 7,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Join the ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                Text(
                  'community',
                  style: TextStyle(
                    color: Color(0xffFFD818),
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
