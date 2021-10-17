import 'dart:math';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healthreminders/AddedSuccessScreens/sucess_screen_labtests.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'LabTests.dart';
import 'LabTestsDatabase.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;


class AddLabTests extends StatefulWidget {
  @override
  _AddLabTestsState createState() => _AddLabTestsState();
}

class _AddLabTestsState extends State<AddLabTests> {

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 String _labtestName;
  String _labtestAddress;
  int _timeHours;
  int _timeMinutes;
  String _timeType;
  String _reasonLabTest;
  String _dayLabTest;
  int _dateLabTest;
  int _monthLabTest;
  int _yearLabTest;
//  int _timeFromToday;
  final _timeDatabase = DateTime.now();
  int _id = Random().nextInt(999999999);
  int _id2 = Random().nextInt(999999999);


  String labtestName;
  String labtestTime;
  int labtestDate;
  int labtestMonth;
  int labtestYear;
  String labtestLocation;


  void getInfoMedicine () async{
    var medicineDetails = Firestore.instance.collection('LabTests').where('uid',  isEqualTo: uid);
    medicineDetails.getDocuments().then((data) {
      if (data.documents.length > 0) {
        setState(() {
          labtestName = data.documents[0].data['Lab Tests Name'];
          labtestTime = data.documents[0].data['Time'];
          labtestDate = data.documents[0].data['Date of Lab Test'];
          labtestMonth = data.documents[0].data['Date of Lab Test'];
          labtestYear = data.documents[0].data['Date of Lab Test'];
          labtestLocation = data.documents[0].data['Address of Lab Test'];

        }
        );
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Lab Tests",
          style: TextStyle(
              fontFamily: 'Monster'
          ),
        ),
      ),
      body:
      ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                    child:
                    Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 200),
                            child: Text(
                                'Lab Tests Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:  EdgeInsets.only(top: 20),
                                    child: CircleAvatar(
                                      child:
                                      Icon(
                                        Icons.assessment,
                                        size: 25,
                                        color: Colors.white,
                                      ),

                                      backgroundColor: Colors.black,
                                      radius: 20,
                                    ),
                                  )
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                child:
                                Expanded(
                                  flex: 7,
                                  child: TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) {
                                          return 'Please type the Lab Test Name';
                                        } return null;
                                      },
                                      onSaved: (input) => _labtestName = input,
                                      decoration: InputDecoration(

                                        hintText: "Lab Test Name",
                                        hintStyle: TextStyle(
                                          fontFamily: "Monster",
                                          color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.teal),),
                                      )
                                  ),
                                ),
                              ),
                            ],
                          )

                        ],
                      ),


                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 280),
                  child: Text(
                      "Address",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(top:0, left: 25, right: 25),

                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom: 10),
                            child: CircleAvatar(
                              child:
                              Icon(
                                Icons.location_on,
                                size: 25,
                                color: Colors.white,
                              ),

                              backgroundColor: Colors.black,
                              radius: 20,
                            ),
                          )
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child:
                        Expanded(
                          flex: 7,
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Lab Test Address';
                                } return null;
                              },
                              onSaved: (input) => _labtestAddress = input,
                              decoration: InputDecoration(
                                hintText: "Address",
                                hintStyle: TextStyle(
                                  fontFamily: "Monster",
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 300),
                              child:
                              Text(
                                  "Time",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top:0, left: 25, right: 25),
                              child: Row(
                                children: <Widget>[
                                  DropdownButton<int>(
                                    underline: Container(
                                      height: 2,
                                      color: Colors.teal,
                                    ),
                                    hint: Text(
                                      'Hours',
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),
                                    ),
                                    value: _timeHours,
                                    items: [
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('00', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 00
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('01', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 01
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('02', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 02

                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('03' , style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 03
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('04', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 04
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('05', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 05
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('06', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 06
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('07', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 07
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('08', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 08
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('09', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 09
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('10', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 10
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('11', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 11
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('12', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 12
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('13', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 13
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('14', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 14

                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('15' , style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 15
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('16', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 16
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('17', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 17
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('18', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 18
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('19', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 19
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('20', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 20
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('21', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 21
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('22', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 22
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('23', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 23
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('24', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 24
                                      ),
                                    ],
                                    onChanged: (int newValue) {
                                      setState(() {
                                        _timeHours = newValue;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 30
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  DropdownButton<int>(
                                    underline: Container(
                                      height: 2,
                                      color: Colors.teal,
                                    ),
                                    hint: Text(
                                      'Minutes',
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),
                                    ),
                                    value: _timeMinutes,
                                    items: [
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('00', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 00
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('01', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 01
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('02', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 02

                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('03' , style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 03
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('04', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 04
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('05', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 05
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('06', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 06
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('07', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 07
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('08', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 08
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('09', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 09
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('10', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 10
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('11', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 11
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('12', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 12
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('13', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 13
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('14', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 14

                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('15' , style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 15
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('16', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 16
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('17', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 17
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('18', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 18
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('19', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 19
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('20', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 20
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('21', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 21
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('22', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 22
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('23', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 23
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('24', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 24
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('25', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 25
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('26', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 26

                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('27' , style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 27
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('28', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 28
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('29', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 5
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('30', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 30
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('31', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 31
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('32', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 32
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('33', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 33
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('34', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 34
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('35', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 35
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('36', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 36
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('37', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 37

                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('38' , style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 38
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('39', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 39
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('40', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 40
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('41', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 41
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('42', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 42
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('43', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 43
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('44', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 44
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('45', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 45
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('46', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 46
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('47', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 47
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('48', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 48
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('49', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 49
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('50', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 50

                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('51' , style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 51
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('52', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 52
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('53', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 53
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('54', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 54
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('55', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 55
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('56', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 56
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('57', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 57
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('58', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 58
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('59', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 59
                                      ),
                                      DropdownMenuItem<int>(
                                          child: Row(
                                            children: <Widget>[
                                              Text('60', style: TextStyle(color: Colors.black),
                                              ),

                                            ],
                                          ),
                                          value: 60
                                      )

                                    ],
                                    onChanged: (int newValue) {
                                      setState(() {
                                        _timeMinutes = newValue;
                                      });
                                    },
                                  ),
//                                    SizedBox(
//                                      width: 20.0,
//                                    ),
//                                    Expanded(
//                                      child: Padding(
//                                        padding: EdgeInsets.only(top: 0, right: 45),
//                                        child: DropdownButton<String>(
//                                          underline: Container(
//                                            height: 2,
//                                            color: Colors.teal,
//                                          ),
//                                          hint: Text(
//                                              'AM/PM?',
//                                            style: TextStyle(
//                                                color: Colors.grey
//                                            ),
//                                          ),
//                                          value: _timeType,
//                                          items: [
//                                            DropdownMenuItem<String>(
//                                                child:Text('AM', style: TextStyle(color: Colors.blueGrey),
//                                                ),
//                                                value: 'AM'
//                                            ),
//                                            DropdownMenuItem<String>(
//                                                child:Text('PM', style: TextStyle(color: Colors.blueGrey ),
//                                                ),
//                                                value: 'PM'
//                                            ),
//
//
//                                          ],
//                                          onChanged: (String newValue) {
//                                            setState(() {
//                                              _timeType = newValue;
//                                            });
//                                          },
//                                        ),
//                                      ),
//                                    ),
                                ],

                              ),
                            )

                          ],
                        ),
                      ],
                    )
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(right: 130),
                  child: Text(
                      "Reason for the Lab Test",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      )
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(top:0, left: 25, right: 25),

                  child: Row(
                    children: <Widget>[
                      Container(
                        child:
                        Expanded(

                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Lab Test Reason';
                                } return null;
                              },
                              onSaved: (input) => _reasonLabTest = input,
                              decoration: InputDecoration(
                                hintText: "Reason",
                                hintStyle: TextStyle(
                                  fontFamily: "Monster",
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(right: 200),
                  child: Text(
                      "Day of Lab Test",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      )
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(top:0, left: 25, right: 260),

                  child: Row(
                    children: <Widget>[
                      Container(
                        child:
                        Expanded(

                          child: DropdownButton<String>(
                            underline: Container(
                              height: 2,
                              color: Colors.teal,
                            ),
                            hint: Text(
                              'Day',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                            value: _dayLabTest,
                            items: [
                              DropdownMenuItem<String>(
                                  child:Text('Monday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Monday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Tuesday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Tuesday '
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Wednesday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Wednesday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Thursday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Thursday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Friday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Friday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Saturday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Saturday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Sunday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Sunday'
                              ),
                            ],
                            onChanged: (String newValue) {
                              setState(() {
                                _dayLabTest = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
      SizedBox(
        height: 15,
      ),
      
     SizedBox(
         height: 5,
     ),

      Padding(
        padding: EdgeInsets.only(right: 170),
        child: Text(
            "Date of Appointment",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,

            )
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top:0, left: 25, right: 115),
        child: Row(
            children: <Widget>[
              DropdownButton<int>(
                underline: Container(
                  height: 2,
                  color: Colors.teal,
                ),
                hint: Text(
                  'Day',
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),
                value: _dateLabTest,
                items: [
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('1st', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 1
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('2nd', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 3
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('4th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 4
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('5th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 5
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('6th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 6
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('7th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 7
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('8th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 8
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('9th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 9
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('10th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 10
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('11th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 11
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('12th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 12
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('13th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 13
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('14th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 14
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('15th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 15
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('16th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 16
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('17th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 17
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('18th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 18
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('19th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 19
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('20th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 20
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('21st', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 21
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('22nd', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 22
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('23rd', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 23
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('24th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 24
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('25th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 25
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('26th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 26
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('27th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 27
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('28th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 28
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('29th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 29
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('30th', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 30
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('31st', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 31
                  ),

                ],
                onChanged: (int newValue) {
                  setState(() {
                    _dateLabTest = newValue;
                  });
                },
              ),

              SizedBox(
                width: 15,
              ),
              DropdownButton<int>(
                underline: Container(
                  height: 2,
                  color: Colors.teal,
                ),
                hint: Text(
                  'Month',
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),
                value: _monthLabTest,
                items: [
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('January', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 1
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('February', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 2

                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('March' , style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 3
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('April', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 4
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('May', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 5
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('June', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 6
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('July', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 7
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('August', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 8
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('September', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 9
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('October', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 10
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('November', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 11
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('December', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 12
                  )
                ],
                onChanged: (int newValue) {
                  setState(() {
                    _monthLabTest = newValue;
                  });
                },
              ),

              SizedBox(
                width: 15,
              ),
              DropdownButton<int>(
                underline: Container(
                  height: 2,
                  color: Colors.teal,
                ),
                hint: Text(
                  'Year',
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),
                value: _yearLabTest,
                items: [
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('2019', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 2019
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('2020', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 2020

                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('2021' , style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 2021
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('2022', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 2022
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('2023', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 2023
                  ),
                  DropdownMenuItem<int>(
                      child: Row(
                        children: <Widget>[
                          Text('2024', style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      value: 2024
                  )
                ],
                onChanged: (int newValue) {
                  setState(() {
                    _yearLabTest = newValue;
                  });
                },
              ),
            ]),
      )],
            ),
      ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(right:60, left:60),
                  alignment: Alignment.bottomCenter,
                  height: 50,
                  width: 250,
                  child: Material(
                    borderRadius: BorderRadius.circular(1000),
                    shadowColor: Colors.tealAccent,
                    color: Colors.teal,
                    elevation: 7.0,
                    child: FlatButton(
                        onPressed: () async{
                          final _form = _formKey.currentState;
                          if (_form.validate()) {
                            _form.save();
                            try {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) =>
                                      SuccessScreenLabTests()));


                              String _uid = await getCurrentUser();

                              await DatabaseService().labTestData(
                                  _labtestName,
                                  _labtestAddress,
                                  _timeHours,
                                  _timeMinutes,
                                  _timeType,
                                  _reasonLabTest,
                                  _dayLabTest,
                                  _dateLabTest,
                                  _monthLabTest,
                                  _yearLabTest,
                                  _timeDatabase,
                                  _uid,
                                _id,
                                _id2,
                              );
                              scheduleNotificationLabTests();
                              scheduleNotificationLabTestsTwo();


                            } catch (e) {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      // return object of type Dialog
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        elevation: 5,
                                        title: Center(child: Text('Alert')),
                                        titleTextStyle: TextStyle(
                                          color: Colors.teal,
                                          fontFamily: 'Monster',
                                          fontSize: 20.0,
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,

                                        ),
                                        content: Text('There is a error, try again'),
                                        contentTextStyle: TextStyle(
                                          fontFamily: 'Monster',
                                          color: Colors.black,
                                        ),
                                        actions: <Widget> [
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed('/addlabtest');
                                            },
                                            child: Text('Try Again'),
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed('/labtest');
                                            },
                                            child: Text('Cancel Entry'),
                                          )
                                        ],
                                      );
                                    }
                                );
                              }
                              );
                            }
                          }
                        },
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
                        )
                    ),
                  ),
                ),
  ]
      )
            );

  }
  Future<void> scheduleNotificationLabTests() async {
    final now = DateTime(_yearLabTest, _monthLabTest, _dateLabTest);
    final labTestDate = DateTime.now();
    final difference = labTestDate.difference(now).inHours;
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
    var scheduledNotificationDateTime =
    DateTime.now().subtract(Duration(hours: difference)).add((Duration(hours: 12)));
    var androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description',
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.Max,
      priority: Priority.High,
      showWhen: true,
      vibrationPattern: vibrationPattern
    );
    var iOSPlatformChannelSpecifics =
    IOSNotificationDetails(sound: 'notification');
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        _id,
        'Reminder for Lab Test',
        'Today is your Lab Test for $_labtestName for $_reasonLabTest. ',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  Future<void> scheduleNotificationLabTestsTwo() async {
    final now = DateTime(_yearLabTest, _monthLabTest, _dateLabTest);
    final appointmentDate = DateTime.now();
    final difference = appointmentDate.difference(now).inHours;

    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
    var scheduledNotificationDateTime =
    DateTime.now().subtract(Duration(hours: difference)).add((Duration(hours: 2)));
    var androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description',
        sound: RawResourceAndroidNotificationSound('notification'),
        importance: Importance.Max,
        priority: Priority.High,
        showWhen: true,
        vibrationPattern: vibrationPattern
    );
    var iOSPlatformChannelSpecifics =
    IOSNotificationDetails(sound: 'notification');
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        _id2,
        'Reminder for Lab Test',
        'You have a $_labtestName Lab Test in 2 Hours. ',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}

Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final _uid = user.uid;
  print(_uid);
  return _uid.toString();
}