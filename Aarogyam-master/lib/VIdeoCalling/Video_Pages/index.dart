import 'dart:async';
//import 'dart:math';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:healthreminders/VideoCalling/Video_Pages/calls.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  String _channelName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Channel Name'),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
//                      height: 400,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text('Enter the Channel Name below',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                //                  color: Colors.teal,
                                fontSize: 20)),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: TextFormField(
                              controller: _channelController,
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Channel name is mandatory';
                                }
                                return null;
                              },
                              onSaved: (input) => _channelName = input,
                              decoration: InputDecoration(
                                errorText: _validateError
                                    ? 'Channel name is mandatory'
                                    : null,
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                                hintText: 'Channel name',
                              ),
                            ))
                          ],
                        ),
                        Column(
                          children: [
                            ListTile(
                              title: Text('Are you the Host?'),
                              leading: Radio(
                                value: ClientRole.Broadcaster,
                                groupValue: _role,
                                onChanged: (ClientRole value) {
                                  setState(() {
                                    _role = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text('Are you a Participant?'),
                              leading: Radio(
                                value: ClientRole.Audience,
                                groupValue: _role,
                                onChanged: (ClientRole value) {
                                  setState(() {
                                    _role = value;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            alignment: Alignment.bottomCenter,
                            height: 50,
                            width: 250,
                            child: Material(
                              borderRadius: BorderRadius.circular(1000),
                              shadowColor: Colors.tealAccent,
                              color: Colors.teal,
                              elevation: 7.0,
                              child: FlatButton(
                                  onPressed: onJoin,
                                  child: Center(
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Monster",
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  )),
                            )),
//                              SizedBox(
//                                height: 30,
//                              ),
//                              Container(
//                                  alignment: Alignment.bottomCenter,
//                                  height: 50,
//                                  width: 250,
//                                  child: Material(
//                                    borderRadius: BorderRadius.circular(1000),
//                                    shadowColor: Colors.tealAccent,
//                                    color: Colors.teal,
//                                    elevation: 7.0,
//                                    child: FlatButton(
//                                        onPressed: () =>
//                                            generateRandomNumber(),
//                                        child: Center(
//                                          child: Text(
//                                            "Generate Room Number",
//                                            style: TextStyle(
//                                              color: Colors.white,
//                                              fontWeight: FontWeight.bold,
//                                              fontFamily: "Monster",
//                                              fontSize: 15.0,
//
//                                            ),
//                                          ),
//                                        )
//                                    ),
//                                  )
//                              ),

                        SizedBox(
                          height: 40,
                        ),
//                              Container(
//                                  child: Text(
//                                      '$_number'
//                                  )
//                              ),
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Share your Room Name'),
                          onTap: () async {
                            final _form = _formKey.currentState;
                            if (_form.validate()) {
                              _form.save();

                              String msg =
                                  "Join my MediRemi meeting by entering the Room Name- '$_channelName' in the app. ";

                              FlutterShareMe().shareToSystem(msg: msg);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
            // role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    if (await Permission.microphone.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }
    if (await Permission.camera.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }
  }

//        void generateRandomNumber() {
//          var random = new Random();
//
//          // Printing Random Number between 1 to 100 on Terminal Window.
//          int _number = random.nextInt(999999999);
//
////          int _number = 0;
////          void GenerateRandomNumber() {
////            final _random = new Random();
////            int next(int min, int max) => min + _random.nextInt(max - min);
////            setState(() {
////              _number = next(1, 100);
////            });
////          }
//        }

}
