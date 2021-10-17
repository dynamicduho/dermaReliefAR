import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/AddedSuccessScreens/success_screen_medicines.dart';
import 'DatabaseMedicine.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AddMedicine extends StatefulWidget {
  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String _medicineName;
  String _dosage;
  String _pills;
  String _medicineType;
  int _interval;
  int _startingTimeHours;
  int _startingTimeMinutes;
//  String _startingTimeType;
  String _durationTime;
  // String _durationType;
  String _startingDate;
  String _pillsHave;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Tablet';
  final myController = TextEditingController();
  final _timeDatabase = DateTime.now();

  // Printing Random Number between 1 to 100 on Terminal Window.
  int _id = Random().nextInt(999999999);
//   String medicineName;
//   String medicineType;
//   String medicineDosage;
//   int medicineInterval;
//   String medicineStartTimeHours;
//   String medicineStartTimeMinutes;
//  void getInfoMedicine () async{
//    var medicineDetails = Firestore.instance.collection('Medicines').where('uid',  isEqualTo: uid);
//    medicineDetails.getDocuments().then((data) {
//      if (data.documents.length > 0) {
//        setState(() {
//          medicineName = data.documents[0].data['Name'];
//          medicineType = data.documents[0].data['Type'];
//          medicineDosage = data.documents[0].data['Dosage'];
//          medicineInterval = data.documents[0].data['Interval'];
//          medicineStartTimeHours = data.documents[0].data['Starting Time Hours'];
//          medicineStartTimeMinutes = data.documents[0].data['Starting Time Minutes'];
//        }
//        );
//      }
//    });
//  }
  @override
  void initState() {
    super.initState();
    _requestIOSPermissions();
  }

  void _requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Medicines",
            style: TextStyle(fontFamily: 'Monster'),
          ),
        ),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                  child: Column(children: <Widget>[
                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 225),
                        child: Text("Allergent Name",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please type a Name';
                            }
                            return null;
                          },
                          onSaved: (input) => _medicineName = input,
                          decoration: InputDecoration(
                            hintText: "Type Medicine Name",
                            hintStyle: TextStyle(
                              fontFamily: "Monster",
                              color: Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 170),
                        child: Text("Allergent Dosage in mg",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please type the Dosage';
                            }
                            return null;
                          },
                          onSaved: (input) => _dosage = input,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Type the Dosage ",
                            hintStyle: TextStyle(
                              fontFamily: "Monster",
                              color: Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                          )),
                      SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 80),
                        child: Text("Number of Pills to be taken each time",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      TextFormField(
                          validator: (input) {
                            return null;
                          },
                          onSaved: (input) => _pills = input,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Type the Number of pills ",
                            hintStyle: TextStyle(
                              fontFamily: "Monster",
                              color: Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 260),
                        child: Text("Starting Date",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please type the Starting Date';
                            }
                            return null;
                          },
                          onSaved: (input) => _startingDate = input,
                          decoration: InputDecoration(
                            hintText: "Type the Starting Date",
                            hintStyle: TextStyle(
                              fontFamily: "Monster",
                              color: Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                          ))
                    ])
                  ]),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                    child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 250),
                          child: Text("Medicine Type",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 170),
                          child: DropdownButton<String>(
                            underline: Container(
                              height: 2,
                              color: Colors.teal,
                            ),
                            hint: Text(
                              'Select Medicine Type',
                              style: TextStyle(color: Colors.grey),
                            ),
                            value: _medicineType,
                            items: [
                              DropdownMenuItem<String>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        dropdownValue,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 85.0,
                                      ),
                                      ImageIcon(
                                          AssetImage('assets/Tablet.png')),
                                    ],
                                  ),
                                  value: 'Tablet'),
                              DropdownMenuItem<String>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Pill',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 110.0,
                                      ),
                                      ImageIcon(AssetImage('assets/pill.png')),
                                    ],
                                  ),
                                  value: 'Pill'),
                              DropdownMenuItem<String>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Bottle',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 80.0,
                                      ),
                                      ImageIcon(
                                        AssetImage('assets/Bottle.png'),
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                  value: 'Bottle'),
                              DropdownMenuItem<String>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Syringe',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 65.0,
                                      ),
                                      ImageIcon(
                                        AssetImage('assets/Syringe.png'),
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                  value: 'Syringe')
                            ],
                            onChanged: (String newValue) {
                              setState(() {
                                _medicineType = newValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                )),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 200),
                          child: Text("Interval of Reminders",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 200),
                          child: DropdownButton<int>(
                            underline: Container(
                              height: 2,
                              color: Colors.teal,
                            ),
                            hint: Text(
                              'Number of Hours',
                              style: TextStyle(color: Colors.grey),
                            ),
                            value: _interval,
                            items: [
                              DropdownMenuItem<int>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '2 Hours',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  value: 2),
                              DropdownMenuItem<int>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '4 Hours',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  value: 4),
                              DropdownMenuItem<int>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '6 Hours',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  value: 6),
                              DropdownMenuItem<int>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '8 Hours',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  value: 8),
                              DropdownMenuItem<int>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '12 Hours',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  value: 12),
                              DropdownMenuItem<int>(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '24 Hours',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  value: 24)
                            ],
                            onChanged: (int newValue) {
                              setState(() {
                                _interval = newValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                )),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 230),
                          child: Text("First Dosage Time",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, left: 25, right: 25),
                          child: Row(
                            children: <Widget>[
                              DropdownButton<int>(
                                underline: Container(
                                  height: 2,
                                  color: Colors.teal,
                                ),
                                hint: Text(
                                  'Hours',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                value: _startingTimeHours,
                                items: [
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '00',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 00),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '01',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 01),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '02',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 02),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '03',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 03),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '04',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 04),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '05',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 05),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '06',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 06),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '07',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 07),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '08',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 08),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '09',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 09),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '10',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 10),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '11',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 11),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '12',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 12),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '13',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 13),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '14',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 14),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '15',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 15),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '16',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 16),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '17',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 17),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '18',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 18),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '19',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 19),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '20',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 20),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '21',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 21),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '22',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 22),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '23',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 23),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '24',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 24),
                                ],
                                onChanged: (int newValue) {
                                  setState(() {
                                    _startingTimeHours = newValue;
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
                                  style: TextStyle(fontSize: 30),
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
                                  style: TextStyle(color: Colors.grey),
                                ),
                                value: _startingTimeMinutes,
                                items: [
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '00',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 00),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '01',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 01),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '02',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 02),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '03',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 03),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '04',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 04),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '05',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 05),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '06',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 06),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '07',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 07),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '08',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 08),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '09',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 09),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '10',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 10),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '11',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 11),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '12',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 12),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '13',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 13),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '14',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 14),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '15',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 15),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '16',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 16),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '17',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 17),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '18',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 18),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '19',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 19),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '20',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 20),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '21',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 21),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '22',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 22),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '23',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 23),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '24',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 24),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '25',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 25),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '26',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 26),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '27',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 27),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '28',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 28),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '29',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 5),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '30',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 30),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '31',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 31),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '32',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 32),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '33',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 33),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '34',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 34),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '35',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 35),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '36',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 36),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '37',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 37),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '38',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 38),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '39',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 39),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '40',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 40),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '41',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 41),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '42',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 42),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '43',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 43),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '44',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 44),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '45',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 45),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '46',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 46),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '47',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 47),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '48',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 48),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '49',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 49),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '50',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 50),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '51',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 51),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '52',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 52),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '53',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 53),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '54',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 54),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '55',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 55),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '56',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 56),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '57',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 57),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '58',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 58),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '59',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      value: 59),
                                ],
                                onChanged: (int newValue) {
                                  setState(() {
                                    _startingTimeMinutes = newValue;
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
//                                          value: _startingTimeType,
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
//                                              _startingTimeType = newValue;
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
                )),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 250),
                          child: Text("Duration in Days",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, left: 25, right: 25),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 17),
                                  child: TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) {
                                          return 'Please type the Duration number';
                                        }
                                        return null;
                                      },
                                      onSaved: (input) => _durationTime = input,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Number in Days",
                                        hintStyle: TextStyle(
                                          fontFamily: "Monster",
                                          color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                        ),
                                      )),
                                ),
                              ),
                              // SizedBox(
                              //   width: 20.0,
                              // ),
                              // Expanded(
                              //   flex: 3,
                              //   child: Padding(
                              //     padding: EdgeInsets.only(top: 0, left: 0),
                              //     child: DropdownButton<String>(
                              //       underline: Container(
                              //         height: 2,
                              //         color: Colors.teal,
                              //       ),
                              //       hint: Text(
                              //         'Days/Weeks/Months/Years?',
                              //         style: TextStyle(color: Colors.grey),
                              //       ),
                              //       value: _durationType,
                              //       items: [
                              //         DropdownMenuItem<String>(
                              //             child: Text(
                              //               'Days',
                              //               style:
                              //                   TextStyle(color: Colors.black),
                              //             ),
                              //             value: 'Days'),
                              //         DropdownMenuItem<String>(
                              //             child: Text(
                              //               'Weeks',
                              //               style:
                              //                   TextStyle(color: Colors.black),
                              //             ),
                              //             value: 'Weeks '),
                              //         DropdownMenuItem<String>(
                              //             child: Text(
                              //               'Months',
                              //               style:
                              //                   TextStyle(color: Colors.black),
                              //             ),
                              //             value: 'Months'),
                              //         DropdownMenuItem<String>(
                              //             child: Text(
                              //               'Years',
                              //               style:
                              //                   TextStyle(color: Colors.black),
                              //             ),
                              //             value: 'Years'),
                              //       ],
                              //       onChanged: (String newValue) {
                              //         setState(() {
                              //           _durationType = newValue;
                              //         });
                              //       },
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 190),
                          child: Text("Pills you currently have",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, left: 25, right: 25),
                          child: TextFormField(
                              validator: (input) {
                                return null;
                              },
                              onSaved: (input) => _pillsHave = input,
                              decoration: InputDecoration(
                                hintText: "Type the Starting Date",
                                hintStyle: TextStyle(
                                  fontFamily: "Monster",
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                              )),
                        )
                      ],
                    ),
                  ],
                )),
                SizedBox(
                  height: 10,
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SuccessScreenMedicine()));

                                String _uid = await getCurrentUser();
                                await DatabaseService().medicineData(
                                  _medicineName,
                                  _dosage,
                                  _pills,
                                  _startingDate,
                                  _medicineType,
                                  _interval,
                                  _startingTimeHours,
                                  _startingTimeMinutes,
                                  _durationTime,
                                  _pillsHave,
                                  // _durationType,
                                  _uid,
                                  _timeDatabase,
                                  _id,
                                );
                                scheduleNotificationMedicine();
                                scheduleNotificationPillsReminder();
                              } catch (e) {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // return object of type Dialog
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          elevation: 5,
                                          title: Center(child: Text('Alert')),
                                          titleTextStyle: TextStyle(
                                            color: Colors.teal,
                                            fontFamily: 'Monster',
                                            fontSize: 20.0,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          content: Text(
                                              'There is a error, try again'),
                                          contentTextStyle: TextStyle(
                                            fontFamily: 'Monster',
                                            color: Colors.black,
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushNamed('/addmedicine');
                                              },
                                              child: Text('Try Again'),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushNamed('/medicine');
                                              },
                                              child: Text('Cancel Entry'),
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
                SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ],
        ));
  }

  Future<void> scheduleNotificationMedicine() async {
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var time = Time(_startingTimeHours, _startingTimeMinutes, 0);

//    var hour = int.parse(_startingTimeHours[0] + _startingTimeHours[1]);
//    var ogValue = hour;
//    var minute = int.parse(_startingTimeMinutes[2] + _startingTimeMinutes[3]);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name',
        'repeatDailyAtTime description',
        importance: Importance.Max,
        sound: RawResourceAndroidNotificationSound('notification'),
        ledColor: Color(0xFF3EB16F),
        ledOffMs: 1000,
        ledOnMs: 1000,
        enableLights: true,
        vibrationPattern: vibrationPattern);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'notification.aiff');
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    for (int i = 0; i < (24 / _interval).floor(); i++) {
      if ((_startingTimeHours + (_interval * i) > 23)) {
        _startingTimeHours = _startingTimeHours + (_interval * i) - 24;
      } else {
        _startingTimeHours = _startingTimeHours + (_interval * i);
      }
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          _id,
          'Medicine Reminder',
          'Time to take your medicine - $_medicineName',
          time,
          platformChannelSpecifics);
    }
    print('Time: ' + time.toString());
  }

  Future<void> scheduleNotificationPillsReminder() async {
    //  double pillsDay = 24/_interval;
    double durationTime = _durationTime as double;
    double totalHours = 24 * durationTime;
    double totalPills = totalHours / _interval;
    double pills = _pillsHave as double;
    double requiredPills = totalPills - pills;
    double hoursLeft = requiredPills * _interval;
    double hoursForPills = totalHours - hoursLeft;
    int hoursForPills1 = hoursForPills as int;
    // double daysForPills1 = hoursForPills / 24;
    // int daysForPills = daysForPills1 as int;
    var sendNotificationTime = DateTime.now()
        .add(Duration(hours: hoursForPills1))
        .subtract(Duration(hours: 5));

    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description',
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.Max,
      priority: Priority.High,
      showWhen: true,
      vibrationPattern: vibrationPattern,
    );
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'notification');
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        5,
        'Your pills for $_medicineName are getting over',
        'Stock them within the next 5 hours to avoid missing eating your medicine. ',
        sendNotificationTime,
        platformChannelSpecifics);
  }
}

Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final _uid = user.uid;
  print(_uid);
  return _uid.toString();
}
