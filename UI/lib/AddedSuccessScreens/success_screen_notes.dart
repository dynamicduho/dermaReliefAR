import 'dart:async';

import 'package:flutter/material.dart';

import 'package:healthreminders/Notes/Notes.dart';

class SuccessScreenNotes extends StatefulWidget {
  @override
  _SuccessScreenNotesState createState() => _SuccessScreenNotesState();
}
// is animated when a person inputs Notes

class _SuccessScreenNotesState extends State<SuccessScreenNotes> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
      () {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => Notes()));
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
