import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


buildListItemProfilePage(BuildContext context, DocumentSnapshot document) {
  return Column(
    children: <Widget>[
      Card(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:40, right:40, left:40, bottom: 20),
                      child:   CircleAvatar(
                        child:
                        Icon(
                          Icons.person,
                          size: 75,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                        radius: 70,
                      ),

                    ),
                    Text(
                      document['Name'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                          'Email: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        document['Email'],
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                          'Phone Number: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        document['Phone Number'],
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                          'Weight: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        document['Weight'],
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                        'Height: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        document['Height'],
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                          'Age: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        document['Age'],
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                        'Gender: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        document['Gender'],
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(
                          'Blood Group: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        document['Blood Group'],
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: 145,
              )
            ],
          ),
        ),
      ),
    ],
  );
}