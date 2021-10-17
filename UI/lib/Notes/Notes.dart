import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Notes/AddNotes.dart';
import 'package:healthreminders/Notes/BuildListItemNotes.dart';
import 'package:provider/provider.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
final uid =  _auth.currentUser();

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
        title: Center(
        child: Text(
        "Your Notes",
        style: TextStyle(
        fontFamily: 'Roboto'
    ),
    ),
    ),
    backgroundColor: Colors.teal,
    actions: <Widget>[
    Padding(
    padding:  EdgeInsets.only(right: 15.0),
    child: IconButton(
    onPressed: () {
    Navigator.push(
    context, MaterialPageRoute(
    builder: (context) => AddNotes()));
    },
    icon: Icon(Icons.add),
    ),
    ),
    ],
    ),
    body: ListView(
      children: [
        Column(
          children: <Widget>[
//            Container(
//              alignment: Alignment.topLeft,
//              padding: EdgeInsets.only(top:15, left: 10),
//              child: Text(
//                "Your Notes:",
//                style: TextStyle(
//                  fontSize: 25,
//                  fontFamily: 'Roboto'
//                ),
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.only(right: 20, left: 20),
//              child: Divider(
//                color: Colors.black,
//                thickness: 2,
//              ),
//            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                children: <Widget>  [
                  StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection('Notes')
                          .where('uid',  isEqualTo: user.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Padding(
                              padding: EdgeInsets.only(top: 250, left: 75),
                              child: Text(
                                  'Fetching your Notes...',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  )
                              )
                          );
                        else errorNotes(context);
                        return Expanded(
                          child: SizedBox(
                            height: 700,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) =>
                                  buildListItemNotes(
                                      context,
                                      snapshot.data.documents[index]),
                            ),
                          ),
                        );
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),


    );
  }
}
errorNotes(BuildContext context) {

  AlertDialog(
    title: Center(child: Text('Alert')),
    titleTextStyle: TextStyle(
      color: Colors.teal,
      fontFamily: 'Monster',
      fontSize: 20.0,
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,

    ),
    content: Text('Add Notes'),
    contentTextStyle: TextStyle(
      fontFamily: 'Monster',
      color: Colors.black,
    ),
    actions: <Widget> [
      FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => AddNotes()));
        },
        child: Text('ADD NOTES'),
      )
    ],
  );
}