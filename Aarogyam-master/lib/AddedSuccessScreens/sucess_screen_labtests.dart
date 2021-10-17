import 'dart:async';
import 'package:flutter/material.dart';

import 'package:healthreminders/LabTests/LabTests.dart';

class SuccessScreenLabTests extends StatefulWidget {
  @override
  _SuccessScreenLabTestsState createState() => _SuccessScreenLabTestsState();
}

// is animated when a person inputs a Lab Test
class _SuccessScreenLabTestsState extends State<SuccessScreenLabTests> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
      () {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => LabTests()));
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
