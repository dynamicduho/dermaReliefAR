import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/StartupPages/LoginPage.dart';

String _emailID;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class PasswordReset extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: [
                      Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                      child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(35, 110, 0, 0),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(35, 190, 0, 0),
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(235, 180, 0, 0),
                              child: Text(
                                ".",
                                style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment(-1.1, -0.2),
                              padding: EdgeInsets.fromLTRB(80, 320, 10, 0),
                              child: Text(
                                "Please input your Email ID",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment(-1.1, -0.2),
                              padding: EdgeInsets.fromLTRB(60, 350, 0, 0),
                              child: Text(
                                "to get link to Reset Password",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                              Container(
                                padding: EdgeInsets.only(
                                    top: 425, left: 35, right:35),
                                child: Column(

                                    children: <Widget>[
                                      Form(
                                        key: _formKey,
                                        child: Column(

                                          children: <Widget>[
                                            TextFormField(
                                                validator: (input) {
                                                  if (input.isEmpty) {
                                                    return 'Please type a valid email';
                                                  }else{
                                                    _emailID=input;
                                                  }
                                                  return null;
                                                },
                                                onSaved: (input) =>
                                                _emailID = input,
                                                decoration: InputDecoration(
                                                  hintText: "Email ID",
                                                  hintStyle: TextStyle(
                                                    fontFamily: "Monster",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                  ),
                                                  border: OutlineInputBorder(),
//                                                  focusedBorder: UnderlineInputBorder(
//                                                    borderSide: BorderSide(
//                                                        color: Colors.teal),),
                                                )
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),

                                            RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(18.0),
                                                  side: BorderSide(color: Colors.teal)),
                                              color: Colors.teal,
                                              onPressed: () async{
                                                try {
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    FirebaseAuth.instance
                                                        .sendPasswordResetEmail(
                                                        email: _emailID);
                                                   showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          // return object of type Dialog
                                                          return AlertDialog(
                                                            content: Text('Email sent, follow the instructions on the mail to rest your password.'),
                                                            actions: <Widget> [
                                                              FlatButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context, MaterialPageRoute(builder: (context) => MyHomePage()));
                                                                  },
                                                                child: Text('Okay'),
                                                              )
                                                            ],
                                                          );
                                                        }
                                                    );
                                                  }
                                                } catch (e) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        // return object of type Dialog
                                                        return AlertDialog(
                                                          title: Center(child: Text('Alert')),
                                                        titleTextStyle: TextStyle(
                                                        color: Colors.teal,
                                                        fontFamily: 'Monster',
                                                        fontSize: 20.0,
                                                        letterSpacing: 1.5,
                                                        fontWeight: FontWeight.bold,
                                                        decoration: TextDecoration.underline,
                                                        ),
                                                          content: Text('Email not sent'),
                                                          contentTextStyle: TextStyle(
                                                            fontFamily: 'Monster',
                                                            color: Colors.black,
                                                          ),

                                                          actions: <Widget> [
                                                            FlatButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context, MaterialPageRoute(builder: (context) => PasswordReset()));
                                                                },
                                                              child: Text('Try Again'),
                                                            )
                                                          ],
                                                        );
                                                      }
                                                  );
                                                }

                                              },
                                              child: Center(
                                                child: Text(
                                                  "Send Email",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Monster",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            FlatButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(18.0),
                                                  side: BorderSide(color: Colors.black)),
                                              color: Colors.white,
                                              onPressed: () {
                                                Navigator.pop(
                                                    context, MaterialPageRoute(builder: (context) => MyHomePage()));
                                                },
                                              child: Center(
                                                child: Text(
                                                  "Go back",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Monster",
                                                  ),
                                                ),
                                              ),
                                            )
                                          ]
                                        ),
                                      ),
                                          ],

                                        ),
                                      )

                                    ]
                                )
                            )
                          ]
                      ),
                    ],
        )
              );
  }
}