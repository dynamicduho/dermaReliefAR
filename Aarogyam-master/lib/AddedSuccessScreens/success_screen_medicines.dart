import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthreminders/MainPages/Medicine.dart';

class SuccessScreenMedicine extends StatefulWidget {
  @override
  _SuccessScreenMedicineState createState() => _SuccessScreenMedicineState();
}
// is animated when a person inputs a Medicine

class _SuccessScreenMedicineState extends State<SuccessScreenMedicine> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
      () {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => Medicine()));
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
