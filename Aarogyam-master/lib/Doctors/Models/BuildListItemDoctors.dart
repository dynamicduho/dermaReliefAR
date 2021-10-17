import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Doctors/AddAppointment.dart';

final databaseReference = Firestore.instance;


buildListItemDoctors(BuildContext context, DocumentSnapshot document) {
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
                  padding: EdgeInsets.only(left: 50, top: 20),
                  child: Row(
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.grey[700],size: 20.0,),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Name of the Doctor: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
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
                    padding: EdgeInsets.only(left: 50, top: 15),
                    child: Row(
                        children: <Widget>[
                          Icon(Icons.assignment, color: Colors.grey[700],size: 20.0,),

                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Doctor Speciality: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
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
                     padding: EdgeInsets.only(left: 50, top: 15),
                     child: Row(
                        children: <Widget>[
                          Icon(Icons.phone, color: Colors.grey[700],size: 20.0),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Phone Number of Doctor: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
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
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 15),
                    child: Row(
                        children: <Widget>[
                          Icon(Icons.email, color: Colors.grey[700],size: 20.0),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Email ID of the Doctor: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            document['Email ID'],
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
                     padding: EdgeInsets.only(left: 50, top: 15),
                     child: Row(
                        children: <Widget>[
                          Icon(Icons.location_on, color: Colors.grey[700],size: 20.0),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Doctors Address: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            document['Address'],
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
                      FlatButton(
                          child: Text(
                            'DELETE',
                            style: TextStyle(
                                color: Colors.teal
                            ),
                          ),
                          onPressed: () async {
                            await databaseReference
                                .collection('Doctors')
                                .document(document.documentID)
                                .delete();
                          }
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: FlatButton(
                            child: Text(
                              'ADD APPOINTMENTS',
                              style: TextStyle(
                                  color: Colors.teal
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (context) => AddAppoinments()));
                            }
                        ),
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


