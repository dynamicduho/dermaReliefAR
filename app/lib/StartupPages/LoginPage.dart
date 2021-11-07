import 'package:healthreminders/Doctors/AddAppointment.dart';
import 'package:healthreminders/Doctors/AddDoctors.dart';
import 'package:healthreminders/Doctors/Appointments.dart';
import 'package:healthreminders/Doctors/Doctors.dart';
import 'package:healthreminders/LabTests/AddLabTests.dart';
import 'package:healthreminders/LabTests/LabTests.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/MedicineReminders/AddMedicine.dart';
import 'package:healthreminders/Notes/AddNotes.dart';
import 'package:healthreminders/Notes/Notes.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Services/SignUpGoogle.dart';
import 'package:healthreminders/StartupPages/PasswordReset.dart';
import 'package:healthreminders/Models/loading.dart';
import '../MainPages/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

//final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/signup": (BuildContext context) => new SignupPage(),
        "/passwordreset": (BuildContext context) => new PasswordReset(),
        '/addmedicine': (context) => AddMedicine(),
        '/adddoctor': (context) => AddDoctors(),
        '/addappointments': (context) => AddAppoinments(),
        '/addnotes': (context) => AddNotes(),
        '/addlabtest': (context) => AddLabTests(),
        '/medicines': (context) => Medicine(),
        '/doctors': (context) => Doctors(),
        '/appointments': (context) => Appointments(),
        '/notes': (context) => Notes(),
        '/labtest': (context) => LabTests(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _emailID;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 492,
                left: 48,
                child: Container(
                    width: 363,
                    height: 83,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 35,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: Color.fromRGBO(223, 225, 230, 1),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(85, 85, 85, 1),
                                      // fontFamily: 'Inter',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                          top: 0,
                          left: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Username',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      // fontFamily: 'Inter',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ],
                            ),
                          )),
                    ]))),
            Positioned(
                top: 599,
                left: 48,
                child: Container(
                    width: 363,
                    height: 83,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 35,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: Color.fromRGBO(189, 189, 189, 1),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(39, 53, 38, 1),
                                      // fontFamily: 'Inter',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                          top: 0,
                          left: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'password',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      // fontFamily: 'Inter',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ],
                            ),
                          )),
                    ]))),
            Positioned(
                top: 138,
                left: 71,
                child: Container(
                    width: 285,
                    height: 198,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 135,
                          left: 0,
                          child: Text(
                            'Derma Relief',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                // fontFamily: 'Inter',
                                fontSize: 48,
                                letterSpacing: -1.0499999523162842,
                                fontWeight: FontWeight.normal,
                                height: 1.3125),
                          )),
                      Positioned(
                         
                                              ,
                                        ],
                                      ),
                                    )),
                              ]))),
                    ]))),
            Positioned(
                top: 756,
                left: 48,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    color: Color.fromRGBO(237, 24, 75, 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(width: 8),
                            Text(
                              'Sign In',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  // fontFamily: 'Inter',
                                  fontSize: 24,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ])),
    );
  }
}
