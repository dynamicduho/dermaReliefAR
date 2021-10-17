import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final databaseReference = Firestore.instance;
final now =  DateTime.now();
String date = DateFormat('dd-MM-yyyy – kk:mm').format(now);


buildListItemNotes(BuildContext context, DocumentSnapshot document) {
  return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          margin: EdgeInsets.only(right: 20, left:20),

          shadowColor: Colors.teal,
          borderOnForeground: true,
          elevation: 10,
          child: Container(
            child: Column(
                children: <Widget>[
               Padding(
                 padding: EdgeInsets.only(left: 20, top: 30),
                 child: Column(
                   children: <Widget>[
                     Row(
                            children: <Widget>[
                              Icon(Icons.assignment, color: Colors.black,size: 20.0,),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Notes: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                     Padding(
                       padding: EdgeInsets.only(top:10),
                       child: Text(
                         document['Notes'],
                         style: TextStyle(
                           color: Colors.blueGrey,
                           fontFamily: 'Roboto',
                           fontSize: 15,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
                  SizedBox(
                    height: 0,
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 20, top: 30),
                     child: Row(
                        children: <Widget>[
                          Icon(Icons.alarm, color: Colors.black,size: 20.0,),

                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Date and Time Added: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '$date',
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
                              child: Text(
                                'DELETE',
                                style: TextStyle(
                                  color: Colors.teal,
                                ),
                              ),
                              onPressed: () async {
                                await databaseReference
                                    .collection('Notes')
                                    .document(document.documentID)
                                    .delete();
                              }
                        ),
                        ),
                      ]
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



