import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';

//GoogleSignIn _googleSignIn;
//FirebaseUser _user;
//HomePageWidget(FirebaseUser user, GoogleSignIn signIn) {
//  _user = user;
//  _googleSignIn = signIn;
//}

buildListItemGoogle(BuildContext context, DocumentSnapshot document) {
  return ListTile(
      title: Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 45),
        child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.person, color: Colors.white,size: 30.0,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    document['Name'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
//                  Text(_user.displayName,
//                      textAlign: TextAlign.center,
//                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.email, color: Colors.white,size: 25.0,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    document['Email'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ]),
      ));
}
