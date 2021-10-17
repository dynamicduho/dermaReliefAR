import 'dart:async';

import 'package:flutter/material.dart';

import '../Doctors/Doctors.dart';

class SuccessScreenDoctors extends StatefulWidget {
  @override
  _SuccessScreenDoctorsState createState() => _SuccessScreenDoctorsState();
}
// is animated when a person inputs a Doctor

class _SuccessScreenDoctorsState extends State<SuccessScreenDoctors> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
      () {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => Doctors()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Container(
          child: Center(),
        ),
      ),
    );
  }
}
