import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:healthreminders/Doctors/Appointments.dart';
import 'package:healthreminders/Doctors/Doctors.dart';
import 'package:healthreminders/LabTests/LabTests.dart';
import 'package:healthreminders/Models/BuildListItemGoogle.dart';
import 'package:healthreminders/Models/BuildListItemNameEmail.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Notes/Notes.dart';
import 'package:healthreminders/ProfilePages/ProfilePage.dart';
import 'package:healthreminders/ProfilePages/ProfilePageGoogle.dart';
import 'package:healthreminders/StartupPages/LoginPage.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';
import 'package:healthreminders/VIdeoCalling/Video_Pages/index.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final uid = _auth.currentUser();

class MoreOptions extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<MoreOptions> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }

  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'example@example.com',
  );

  final _subjectController = TextEditingController(text: 'Reminder');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  String msg =
      'I found the perfect moisturizer for my skintype thanks to #dermarelief! I love to use the app! Download Derma Relief now on Google Play Store through https://bit.ly/3iDVunK and see the magic!';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
//      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "More Options",
            style: TextStyle(fontFamily: 'Monster'),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person_add),
                        title: Text('Shopping History'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Doctors();
                              },
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.add_circle),
                        title: Text('Consult an expert'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Appointments();
                              },
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.assessment),
                        title: Text('Stores near you'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return LabTests();
                              },
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.assignment),
                        title: Text('Notes'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Notes();
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Divider(
                          color: Colors.blueGrey,
                          thickness: 2,
                        ),
                      ),

                      // ListTile(
                      //   leading: Icon(Icons.video_call),
                      //   title: Text('Video Calling'),
                      //   onTap: () async {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) {
                      //           return IndexPage();
                      //         },
                      //       ),
                      //     );
                      //   },
                      // ),
                      // ListTile(
                      //   leading: Icon(Icons.video_call),
                      //   title: Text('YouTube'),
                      //   onTap: launchURL,
                      // ),

                      // ListTile(
                      //     leading: ImageIcon(
                      //         AssetImage('assets/Whatsapp.png'),
                      //         color: Colors.green
                      //     ),
                      //     title: Text('Share us on WhatsApp'),
                      //     onTap: () {
                      //       FlutterShareMe()
                      //           .shareToWhatsApp(msg: msg);
                      //     }
                      // ),
                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text('Share us'),
                        onTap: () async {
                          FlutterShareMe().shareToSystem(msg: msg);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Delete Account'),
                      ),
                      ListTile(
                          leading: Icon(Icons.arrow_right),
                          title: Text('Privacy Statement and Licensing'),
                          onTap: () {
                            showAboutDialog(
                                context: context,
                                applicationVersion: '2.3',
                                applicationName: 'MediRemi',
                                applicationIcon: ImageIcon(
                                    AssetImage('assets/app_logo.png')),
                                applicationLegalese:
                                    'A Health Reminder App. IARC Certified. We take your privacy and security of personal information with the utmost importance, we use Google Firebase to securely and safely keep all your data. It is our assurance that your private data will not be checked by anyone. Thank you for using our app.');
                          }),
                    ]),
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
                    if (!snapshot.hasData) return Text('Loading...');

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

  googleName() {
    StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("Users Google")
            .where('uid', isEqualTo: uid)
            .snapshots(),
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

  errorNames() {
    Column(children: <Widget>[
      Text(
          'Signed Up with not enough information. Go back to sign up page and sign up again'),
      InkWell(
          onTap: () {
            BuildContext context;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignupPage()));
          },
          child: Text(
            "Login with Google",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Monster",
            ),
          ))
    ]);
  }
}

launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
