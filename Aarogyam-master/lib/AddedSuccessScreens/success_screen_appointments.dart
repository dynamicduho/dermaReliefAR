import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthreminders/Doctors/Appointments.dart';

class SuccessScreenAppoinments extends StatefulWidget {
  @override
  _SuccessScreenAppoinmentsState createState() =>
      _SuccessScreenAppoinmentsState();
}

// is animated when a person inputs Appointments

class _SuccessScreenAppoinmentsState extends State<SuccessScreenAppoinments> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
      () {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => Appointments()));
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
