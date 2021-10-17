import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/AddedSuccessScreens/success_screen_notes.dart';

import 'DatabaseNotes.dart';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _notes;
  final _timeDatabase = Timestamp.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Notes",
            style: TextStyle(
                fontFamily: 'Roboto'
            ),
          ),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          Padding(
            padding:  EdgeInsets.only(right: 15.0),
            child: FlatButton(
              onPressed: () async {
                final _form = _formKey.currentState;
                if (_form.validate()) {
                  _form.save();
                  try {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) =>
                        SuccessScreenNotes()));

                    String _uid = await getCurrentUser();
                    await DatabaseService().notesData(
                      _notes,
                      _uid,
                      _timeDatabase,
                    );
                  } catch (e) {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 5,
                              title: Center(child: Text('Alert')),
                              titleTextStyle: TextStyle(
                                color: Colors.teal,
                                fontFamily: 'Monster',
                                fontSize: 20.0,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,

                              ),
                              content: Text('There is a error, try again'),
                              contentTextStyle: TextStyle(
                                fontFamily: 'Monster',
                                color: Colors.black,
                              ),
                              actions: <Widget> [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/addnotes');
                                  },
                                  child: Text('Try Again'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/notes');
                                  },
                                  child: Text('Cancel Entry'),
                                )
                              ],
                            );
                          }
                      );
                    }
                    );
                  }
                }
              },
              child: Text(
                'DONE',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 130, left: 25, right: 25),

                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                            "Add your Notes",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                          )
                        ),
                      ),
                   Padding(
                     padding: EdgeInsets.only(top: 50),
                     child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please type your notes';
                            } return null;
                          },
                          onSaved: (input) => _notes = input,
                          decoration: InputDecoration(
                            hintText: "Notes Entry",
                            hintStyle: TextStyle(
                              fontFamily: "Monster",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(),
//                            focusedBorder: UnderlineInputBorder(
//                              borderSide: BorderSide(color: Colors.teal),),
                          )
                      ),
                   ),
                      Padding(
                        padding: EdgeInsets.only (top: 30),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Attention: ',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "The information you enter here is for",
                                      style: TextStyle(
                                      fontFamily: 'Roboto',
                                        color: Colors.blueGrey
                                      ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 225),
                                child: Text(
                                    "your own reference.",
                                    style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.blueGrey
                                ),
                                ),
                              ),
                              Text(
                                "In case of emergency, please contact your doctor or local emergency services.",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.blueGrey
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                ],
                  ),
                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding:  EdgeInsets.only(top:300),
//                      child: Container(
//                        alignment: Alignment.bottomCenter,
//                        height: 60,
//                        width: 250,
//                        child: Material(
//                          borderRadius: BorderRadius.circular(1000),
//                          shadowColor: Colors.tealAccent,
//                          color: Colors.teal,
//                          elevation: 7.0,
//                          child: FlatButton(
//                              onPressed: () async {
//                                final _form = _formKey.currentState;
//                                if (_form.validate()) {
//                                  _form.save();
//
//                                  Navigator.pop(context, MaterialPageRoute(builder: (context) =>
//                                      Notes()));
//
//                                  String _uid = await getCurrentUser();
//                                  await DatabaseService().notesData(
//                                     _notes,
//                                     _uid,
//                                    _timeDatabase,
//                                  );
//                                }
//                              },
//                              child: Center(
//                                child: Text(
//                                  "Done",
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                    fontWeight: FontWeight.bold,
//                                    fontFamily: "Monster",
//                                    fontSize: 20.0,
//
//                                  ),
//                                ),
//                              )
//                          ),
//                        ),
//                      ),
//                    ),
//
//
//                  ],
//                ),
              ],
            ),
          ),
        ],
      ),
    );


  }
}
