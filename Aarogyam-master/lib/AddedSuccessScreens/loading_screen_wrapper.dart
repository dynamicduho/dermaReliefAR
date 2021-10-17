import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthreminders/MainPages/home.dart';

class SuccessScreenWrapper extends StatefulWidget {
  @override
  _SuccessScreenWrapperState createState() => _SuccessScreenWrapperState();
}

// is animated when a person logs in
class _SuccessScreenWrapperState extends State<SuccessScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 1500),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitRing(
          color: Colors.teal,
          size: 50.0,
        ),
      ),
    );
  }
}
