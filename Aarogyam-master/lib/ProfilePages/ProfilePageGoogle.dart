import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/ProfilePages/UpdateProfile.dart';
import 'package:healthreminders/Models/BuildListItemProfilePage.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:provider/provider.dart';

class ProfilePageGoogle extends StatefulWidget {
  @override
  _ProfilePageGoogleState createState() => _ProfilePageGoogleState();
}

class _ProfilePageGoogleState extends State<ProfilePageGoogle> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile Page',
            style: TextStyle(fontFamily: 'Monster'),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: FlatButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateProfilePage()));
                    },
                    child: Text(
                      'UPDATE',
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
//      Container(
//      ),
//              SizedBox(
//                height: 10,
//              ),

                Row(
                  children: <Widget>[
                    StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('Users Google ')
                            .where('uid', isEqualTo: user.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Padding(
                                padding: EdgeInsets.only(top: 250, left: 75),
                                child: Text('Fetching your Data...',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    )));
                          return Expanded(
                            child: SizedBox(
                              height: 800,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) =>
                                    buildListItemProfilePage(context,
                                        snapshot.data.documents[index]),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
