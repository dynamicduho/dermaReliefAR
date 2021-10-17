import 'package:flutter/material.dart';
import 'package:healthreminders/ProfilePages/ProfilePage.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Services/DatabaseSignUp.dart';
import 'package:provider/provider.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  String _name;
  String _phoneNumber;
  String _weight;
  String _height;
  String _age;
  String _bloodGroup;
  String _gender;
  String _email;
  String _uid;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Profile Page',
          style: TextStyle(fontFamily: 'Monster'),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              StreamBuilder<UserData>(
                  stream: DatabaseService(uid: user.uid).userData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      UserData userData = snapshot.data;
                      return Form(
                        key: _formKey,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 100, left: 35, right: 35),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please type a Name';
                                    }
                                    return null;
                                  },
                                  initialValue: userData.name,
                                  onSaved: (input) => _name = input,
                                  decoration: InputDecoration(
                                    hintText: "Full Name",
                                    hintStyle: TextStyle(
                                      fontFamily: "Monster",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(),

//                                  focusedBorder: UnderlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.teal),),
                                  )),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please type a Phone Number';
                                    }
                                    return null;
                                  },
                                  onSaved: (input) => _phoneNumber = input,
                                  initialValue: userData.phoneNumber,
                                  decoration: InputDecoration(
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                      fontFamily: "Monster",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(),
//                                        focusedBorder: UnderlineInputBorder(
//                                          borderSide: BorderSide(color: Colors.teal),),
                                  )),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type your weight';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _weight = input,
                                initialValue: userData.weight,
                                decoration: InputDecoration(
                                  hintText: "Weight",
                                  hintStyle: TextStyle(
                                    fontFamily: "Monster",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: Colors.green),),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type your height';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _height = input,
                                initialValue: userData.height,
                                decoration: InputDecoration(
                                  hintText: "Height",
                                  hintStyle: TextStyle(
                                    fontFamily: "Monster",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: Colors.green),),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type your age';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _age = input,
                                initialValue: userData.age,
                                decoration: InputDecoration(
                                  hintText: "Age",
                                  hintStyle: TextStyle(
                                    fontFamily: "Monster",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: Colors.green),),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type your blood group ';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _bloodGroup = input,
                                initialValue: userData.bloodGroup,
                                decoration: InputDecoration(
                                  hintText: "Blood Group",
                                  hintStyle: TextStyle(
                                    fontFamily: "Monster",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: Colors.green),),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type your gender';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _gender = input,
                                initialValue: userData.gender,
                                decoration: InputDecoration(
                                  hintText: "Gender",
                                  hintStyle: TextStyle(
                                    fontFamily: "Monster",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(),
//                                      focusedBorder: UnderlineInputBorder(
//                                        borderSide: BorderSide(color: Colors.green),),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
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
                                      onPressed: () async {
                                        final _form = _formKey.currentState;
                                        if (_form.validate()) {
                                          _form.save();
                                          try {
                                            Navigator.pop(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProfilePage()));

                                            await DatabaseService(uid: user.uid)
                                                .updateUserData(
                                              _name ?? snapshot.data.name,
                                              _email,
                                              _uid,
                                              _phoneNumber ??
                                                  snapshot.data.phoneNumber,
                                              _weight ?? snapshot.data.weight,
                                              _height ?? snapshot.data.height,
                                              _age ?? snapshot.data.age,
                                              _bloodGroup ??
                                                  snapshot.data.bloodGroup,
                                              _gender ?? snapshot.data.gender,
                                            );
                                          } catch (e) {
                                            setState(() {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    // return object of type Dialog
                                                    return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      elevation: 5,
                                                      title: Center(
                                                          child: Text('Alert')),
                                                      titleTextStyle: TextStyle(
                                                        color: Colors.teal,
                                                        fontFamily: 'Monster',
                                                        fontSize: 20.0,
                                                        letterSpacing: 1.5,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                      content: Text(
                                                          'There is a error, try again'),
                                                      contentTextStyle:
                                                          TextStyle(
                                                        fontFamily: 'Monster',
                                                        color: Colors.black,
                                                      ),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            UpdateProfilePage()));
                                                          },
                                                          child:
                                                              Text('Try Again'),
                                                        ),
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ProfilePage()));
                                                          },
                                                          child: Text(
                                                              'Cancel Updating'),
                                                        )
                                                      ],
                                                    );
                                                  });
                                            });
                                          }
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          "Update",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Monster",
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              Text('DO NOT ALTER WITH THESE'),
                              TextFormField(
                                  validator: (input) {
                                    return null;
                                  },
                                  onSaved: (input) => _email = input,
                                  initialValue: userData.email,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.white)),
//                                        focusedBorder: UnderlineInputBorder(
//                                          borderSide: BorderSide(color: Colors.white),),
                                  )),
                              TextFormField(
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please type a Phone Number';
                                    }
                                    return null;
                                  },
                                  onSaved: (input) => _uid = input,
                                  initialValue: userData.uid,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.white)),
//                                        focusedBorder: UnderlineInputBorder(
//                                          borderSide: BorderSide(color: Colors.white),),
                                  )),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return null;
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
