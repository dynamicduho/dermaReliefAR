import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final databaseReference = Firestore.instance;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

buildListItemMedicine(BuildContext context, DocumentSnapshot document) {
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
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(1000),
//                          ),
        child: Column(children: <Widget>[
//                          Padding(
//                            padding: EdgeInsets.only(top:10),
//                            child: Text(
//                              'Medicine',
//                              style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 20,
//                                fontWeight: FontWeight.bold,
//                                fontFamily: 'Roboto',
//                                decoration: TextDecoration.underline
//                              ),
//                            ),
//                          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, top: 10),
            child: Row(
              children: <Widget>[
//                                Icon(Icons.assignment, color: Colors.black,size: 20.0,),

                Text(
                  document['Name'],
                  style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, top: 15),
            child: Row(
              children: <Widget>[
//                                ImageIcon(
//                                    AssetImage('assets/pill.png'),
//                                    color: Colors.black,
//                                    size: 20.0
//                                ),
//                                SizedBox(
//                                  width: 15,
//                                ),
                Text(
                  'Dosage: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  document['Dosage'],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  ' mg',
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
            padding: EdgeInsets.only(left: 50, top: 10),
            child: Row(
              children: <Widget>[
//                                Icon(Icons.arrow_forward, color: Colors.black,size: 20.0),
//                                SizedBox(
//                                  width: 15,
//                                ),
                Text(
                  'Medicine Type: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  document['Type'],
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
            padding: EdgeInsets.only(left: 50, top: 10),
            child: Row(
              children: <Widget>[
//                                Icon(Icons.arrow_forward, color: Colors.black,size: 20.0),
//                                SizedBox(
//                                  width: 15,
//                                ),
                Text(
                  'Interval: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  document['Interval'].toString(),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  ' Hours',
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
            padding: EdgeInsets.only(left: 50, top: 10),
            child: Row(
              children: <Widget>[
//                                Icon(Icons.arrow_forward, color: Colors.black,size: 20.0),
//                                SizedBox(
//                                  width: 15,
//                                ),
                Text(
                  'Pills: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  document['Pills'],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, top: 10),
            child: Row(
              children: <Widget>[
//                                Icon(Icons.alarm, color: Colors.black,size: 20.0),
//                                SizedBox(
//                                  width: 15,
//                                ),
                Text(
                  'Starting Time: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  document['Starting Time Hours'].toString().padLeft(2, '0'),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  ":",
                ),
                Text(
                  document['Starting Time Minutes'].toString().padLeft(2, '0'),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
//                                      Text(
//                                        " ",
//                                      ),
//                                      Text(
//                                        document['Starting Time Type'],
//                                        style: TextStyle(
//                                          color: Colors.blueGrey,
//                                          fontSize: 15,
//                                        ),
//                                      )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, top: 10),
            child: Row(
              children: <Widget>[
//                                Icon(Icons.alarm, color: Colors.black,size: 20.0),
//                                SizedBox(
//                                  width: 15,
//                                ),
                Text(
                  'Starting Date:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  " ",
                ),
                Text(
                  document['Starting Date'],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, top: 10),
            child: Row(
              children: <Widget>[
//                                Icon(Icons.alarm, color: Colors.black,size: 20.0),
//                                SizedBox(
//                                  width: 15,
//                                ),
                Text(
                  'Duration:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  " ",
                ),
                Text(
                  document['Duration Time'],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  " ",
                ),
                Text(
                  document['Duration Type'],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          ButtonBar(children: <Widget>[
//
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
                   int id =  document['id'];
                    await databaseReference
                        .collection('Medicines')
                        .document(document.documentID)
                        .delete();
                    await flutterLocalNotificationsPlugin.cancel(id);
                  }),
            ),
          ])
        ]),
      ),
    ),
    SizedBox(
      height: 40,
    ),
  ]);
}
