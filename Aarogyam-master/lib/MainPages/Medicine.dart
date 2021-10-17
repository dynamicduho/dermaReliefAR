import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/ProfilePages/ProfilePage.dart';
import 'package:healthreminders/ProfilePages/ProfilePageGoogle.dart';
import 'package:healthreminders/MedicineReminders/AddMedicine.dart';
import 'package:healthreminders/MedicineReminders/Models/BuildListItemMedicines.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Models/BuildListItemGoogle.dart';
import 'package:healthreminders/StartupPages/LoginPage.dart';
import 'package:healthreminders/Models/BuildListItemNameEmail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/VIdeoCalling/Video_Pages/index.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final uid = _auth.currentUser();

//GoogleSignIn _googleSignIn;
//FirebaseUser _user;
//homePageWidget(FirebaseUser user, GoogleSignIn signIn) {
//  _user = user;
//  _googleSignIn = signIn;
//}

class Medicine extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }
//
//  String medicineName;
//  String medicineType;
//  String medicineDosage;
//  int medicineInterval;
//  String medicineStartTime;
//
//  void getInfoMedicine () async{
//    var medicineDetails = Firestore.instance.collection('Medicines').where('uid',  isEqualTo: uid);
//    medicineDetails.getDocuments().then((data) {
//      if (data.documents.length > 0) {
//        setState(() {
//          medicineName = data.documents[0].data['Name'];
//          medicineType = data.documents[0].data['Type'];
//          medicineDosage = data.documents[0].data['Dosage'];
//          medicineInterval = data.documents[0].data['Interval'];
//          medicineStartTime = data.documents[0].data['Starting Time'];
//
//
//        }
//        );
//      }
//    });
//  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Allergies",
            style: TextStyle(fontFamily: 'Roboto'),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddMedicine()));
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
//                  alignment: Alignment.topLeft,
//                  padding: EdgeInsets.only(left: 15, right: 185, top: 20),
//                  child: Text(
//                    "Your Medicines",
//                    style: TextStyle(
//                      fontSize: 25,
//                      fontFamily: 'Roboto',
//                      fontWeight: FontWeight.bold
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
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance
                              .collection('Medicines')
                              .where('uid', isEqualTo: user.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Padding(
                                  padding: EdgeInsets.only(top: 250, left: 75),
                                  child: Text('Fetching your Medicines...',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      )));
                            else
                              errorMedicine(context);
                            return Expanded(
                              child: SizedBox(
                                height: 800,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.documents.length,
                                  itemBuilder: (context, index) =>
                                      buildListItemMedicine(context,
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
        drawer: Drawer(
            child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection("Users")
                      .where('uid', isEqualTo: user.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Text('Loading...');
                    else
                      googleName();
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => buildListItem(
                          context, snapshot.data.documents[index]),
                    );
                  }),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Google Profile'),
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePageGoogle();
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.video_call),
                    title: Text('Video Calling'),
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return IndexPage();
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: () {
                      _signOut().whenComplete(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      });
                    },
                  ),
                ]),
              ),
            ),
          ],
        )));
  }
}

googleName() {
  StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("Users Google").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Text('Loading...');
        else
          googleName();
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) =>
              buildListItemGoogle(context, snapshot.data.documents[index]),
        );
      });
}

errorMedicine(BuildContext context) {
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
    content: Text('Add Medicines'),
    contentTextStyle: TextStyle(
      fontFamily: 'Monster',
      color: Colors.black,
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddMedicine()));
        },
        child: Text('ADD MEDICINES'),
      )
    ],
  );
}
