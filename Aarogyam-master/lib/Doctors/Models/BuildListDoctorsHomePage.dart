import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Doctors/AddDoctors.dart';

final databaseReference = Firestore.instance;


buildListItemDoctorsHomePage(BuildContext context, DocumentSnapshot document) {
  return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          shadowColor: Colors.teal,
          borderOnForeground: true,
          margin: EdgeInsets.only(right: 20, left:20),
          elevation: 10,
          child: Container(
            child: Column(
                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.only(top:10),
//                    child: Text(
//                      'Doctor',
//                      style: TextStyle(
//                          color: Colors.black,
//                          fontSize: 20,
//                          fontWeight: FontWeight.bold,
//                          fontFamily: 'Roboto',
//                          decoration: TextDecoration.underline
//                      ),
//                    ),
//                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.person, color: Colors.grey[700],size: 20.0,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          document['Doctor Name'],
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.assignment, color: Colors.grey[700],size: 20.0,),

                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          document['Doctor Speciality'],
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.phone, color: Colors.grey[700],size: 20.0),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          document['Phone Number'],
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: FlatButton(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'ADD DOCTORS',
                                  style: TextStyle(
                                      color: Colors.teal
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () async {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AddDoctors();
                                    },
                                  )
                              );
                            }
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'For more details and deleting go to the Doctors Page. To add Appointments go to the Appointment Page',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ]
            ),
          ),

        ),
        SizedBox(
          height: 40,
        ),
      ]
  );

}

