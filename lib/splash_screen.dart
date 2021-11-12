import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_app/layout/home_layout.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeLayout()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'images/todoIcon.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              // child: CircleAvatar(
              //   backgroundColor: Colors.amber,
              //   radius: 100,
              //   child: CircleAvatar(
              //     backgroundImage: AssetImage("images/todoIcon.png"),
              //         radius: 90,
              //       ),
              // ),
            ),
                  RichText(
                    text: TextSpan(
                        text: "W",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 55,
                            fontFamily: 'Great Rebellion',
                            fontWeight: FontWeight.w600
                        ),
                        children: <TextSpan> [
                          TextSpan(
                            text: "hat's up  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          TextSpan(
                            text: "T",
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 45,
                                fontFamily: 'Great Rebellion',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          TextSpan(
                            text: "oday !",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ]
                    ),

                  )
                ],
              ),
            ),
    );
  }
}