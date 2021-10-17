import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Doctors/AddAppointment.dart';
import 'package:healthreminders/Doctors/Models/BuildListItemAppointments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:healthreminders/Models/User.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
final uid =  _auth.currentUser();


class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
//
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
              "Your Appointments",
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
                      builder: (context) => AddAppoinments()));
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
//                  padding: EdgeInsets.only(left: 15, right: 155, top: 20),
//                  alignment: Alignment.topLeft,
//                  child: Text(
//                    "Your Appoinments:",
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
                          stream: Firestore.instance.collection("Appointments")
                              .where('uid',  isEqualTo: user.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Padding(
                                  padding: EdgeInsets.only(top: 250, left: 75),
                                  child: Text(
                                      'Fetching your Appointments...',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      )
                                  )
                              );
                            else errorAppoinments(context);
                              return Expanded(
                                child: SizedBox(
                                  height: 800,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) =>
                                        buildListItemAppointments(
                                            context,
                                            snapshot.data.documents[index]),


                                  ),


                                ),
                              );

                          }),

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

errorAppoinments(BuildContext context) {
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
    content: Text('Add Appointments'),
    contentTextStyle: TextStyle(
      fontFamily: 'Monster',
      color: Colors.black,
    ),
    actions: <Widget> [
      FlatButton(
        onPressed: () {
  Navigator.push(
  context, MaterialPageRoute(
  builder: (context) => AddAppoinments()));
        },
        child: Text('ADD APPOINTMENTS'),
      )
    ],
  );
}