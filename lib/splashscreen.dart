import 'dart:async';

import 'login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationController.repeat();

    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 9,
            child: Column(
              children: [
                SizedBox(
                  height: 70.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('images/bbbb.png'),
                  radius: 100.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Stock & Pharmacy',
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold)),
                Text('Manage all Order and medicen',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30.0,
                ),
                CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: animationController.drive(
                        ColorTween(begin: Colors.red, end: Colors.red[900]))),
                SizedBox(
                  height: 80.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('** Pharmacy Application ** ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold)),
          ),
        ],
      )),
    );
  }
}
