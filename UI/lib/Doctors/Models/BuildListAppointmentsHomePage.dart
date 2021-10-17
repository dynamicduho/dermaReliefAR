import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Doctors/AddAppointment.dart';

final databaseReference = Firestore.instance;

buildListItemAppointmentsHomePage(
    BuildContext context, DocumentSnapshot document) {
  return Column(children: <Widget>[
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      shadowColor: Colors.teal,
      borderOnForeground: true,
      margin: EdgeInsets.only(right: 20, left: 20),
      elevation: 10,
      child: Container(
        child: Column(children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.only(top:10),
//                    child: Text(
//                      'Appoinment',
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
                Icon(
                  Icons.person,
                  color: Colors.grey[700],
                  size: 20.0,
                ),
                SizedBox(
                  width: 10,
                ),
//                          Text(
//                            'Name of the Doctor: ',
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 15,
//                              fontWeight: FontWeight.bold,
//
//                            ),
//                          ),
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
                Icon(
                  Icons.assignment,
                  color: Colors.grey[700],
                  size: 20.0,
                ),

                SizedBox(
                  width: 15,
                ),
//                          Text(
//                            'Appoinment Details: ',
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 15,
//                            ),
//                          ),
                Text(
                  document['Appointment Details'],
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
                Icon(Icons.alarm, color: Colors.grey[700], size: 20.0),
                SizedBox(
                  width: 15,
                ),
//                          Text(
//                            'Time of Appoinment: ',
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 15,
//                            ),
//                          ),
                Text(
                  document['Time Hours'].toString().padLeft(2, '0'),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  ":",
                ),
                Text(
                  document['Time Minutes'].toString().padLeft(2, '0'),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),

//                        Text(
//                          document['Time Type'],
//                          style: TextStyle(
//                            color: Colors.blueGrey,
//                            fontSize: 15,
//                          ),
//                        )
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
                Icon(Icons.arrow_forward, color: Colors.grey[700], size: 20.0),
                SizedBox(
                  width: 15,
                ),
//                          Text(
//                            'Date of Appointment: ',
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 15,
//
//                            ),
//                          ),
                Text(
                  document['Date of Appointment'].toString(),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  '/',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  document['Month of Appointment'].toString(),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  '/',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  document['Year of Appointment'].toString(),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 15),
            child: Row(
              children: <Widget>[
                Icon(Icons.arrow_forward, color: Colors.black, size: 20.0),
                SizedBox(
                  width: 15,
                ),
//                          Text(
//                            'Day of Appointment: ',
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 15,
//
//                            ),
//                          ),
                Text(
                  document['Day of Appointment'],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          ButtonBar(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: FlatButton(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'ADD',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                        Text(
                          'APPOINTMENTS',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return AddAppoinments();
                        },
                      ));
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  'For more details and deleting go to the Appointments Page',
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
        ]),
      ),
    ),
    SizedBox(
      height: 40,
    ),
  ]);
}
