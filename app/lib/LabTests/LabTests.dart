import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/LabTests/AddLabTests.dart';
import 'package:healthreminders/LabTests/BuildListItemLabTests.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
final uid =  _auth.currentUser();


class LabTests extends StatefulWidget {
  @override
  _LabTestsState createState() => _LabTestsState();
}

class _LabTestsState extends State<LabTests> {

//  Future<void> _signOut() async {
//    try {
//      await FirebaseAuth.instance.signOut();
//    } catch (e) {
//      print(e); //
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Your Lab Tests",
              style: TextStyle(
                  fontFamily: 'Monster'
              ),
            ),
          ),
          backgroundColor: Colors.teal,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => AddLabTests()));
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
//                Container(
//                  padding: EdgeInsets.only(left: 15, right: 185, top: 20),
//                  alignment: Alignment.topLeft,
//                  child: Text(
//                    "Your Lab Tests:",
//                    style: TextStyle(
//                      fontSize: 25,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ),
//                Container(
//                  padding: EdgeInsets.only(right: 20, left: 20),
//                  child: Divider(
//                    color: Colors.black,
//                    thickness: 2,
//                  ),
//                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    children: <Widget>[
                      StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance.collection("LabTests")
                              .where('uid',  isEqualTo: user.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Padding(
                                  padding: EdgeInsets.only(top: 250, left: 75),
                            child: Text(
                            'Fetching your Lab Tests...',
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            )
                            )
                            );
                            else errorLabTests(context);
                              return Expanded(
                                child: SizedBox(
                                  height: 800,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) =>
                                        buildListItemLabTests(
                                            context,
                                            snapshot.data.documents[index]),


                                  ),


                                ),
                              );

                          }),

                    ],
                  ),
                ),

//                Column(
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.only(top: 600),
//                      child: Center(
//                        child: Container(
//                          alignment: Alignment.bottomCenter,
//                          height: 60,
//                          width: 250,
//                          child: Material(
//                            borderRadius: BorderRadius.circular(1000),
//                            shadowColor: Colors.tealAccent,
//                            color: Colors.teal,
//                            elevation: 7.0,
//                            child: FlatButton(
//                                onPressed: () {
//                                  Navigator.push(
//                                      context, MaterialPageRoute(
//                                      builder: (context) => AddMedicine()));
//                                },
//                                child: Center(
//                                  child: Text(
//                                    "Add a Med",
//                                    style: TextStyle(
//                                      color: Colors.white,
//                                      fontWeight: FontWeight.bold,
//                                      fontFamily: "Monster",
//                                      fontSize: 20.0,
//
//                                    ),
//                                  ),
//                                )
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),

              ],
            ),
          ],
        ),

    );
  }
}

errorLabTests(BuildContext context) {
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
    content: Text('Add Lab Tests'),
    contentTextStyle: TextStyle(
      fontFamily: 'Monster',
      color: Colors.black,
    ),
    actions: <Widget> [
      FlatButton(
        onPressed: () {
   Navigator.push(
      context, MaterialPageRoute(
      builder: (context) => AddLabTests()));
        },
        child: Text('ADD LAB TESTS'),
      )
    ],
  );
}