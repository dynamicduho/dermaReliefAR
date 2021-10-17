//bottom: PreferredSize(
//          preferredSize: Size(double.infinity, 68),
//    child: Padding(
//            padding:  EdgeInsets.fromLTRB(0, 10, 0, 0),
//            child: DateIndicator(
//                indicatorColor: Colors.white,
//                activeBubbleColor: Colors.white,
//                numberColor: Colors.white,
//                holderColor: Colors.teal,
//                textColor: Colors.black,
//                selectedBorderColor: Colors.white70,
//                indicatorShadowColor: Colors.white,
//                onHolderTap: (int day) =>
//                    Navigator.push(
//                        context, MaterialPageRoute(builder: (context) => Medicine()))
//            )
//            ),
//          ),



//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//
//
//ListView(
//children: [
//Column(
//children: <Widget>[
//Container(
//padding: EdgeInsets.only(left: 15, right:185, top: 20),
//child: Text(
//"Your Medicines:",
//style: TextStyle(
//fontSize: 25,
//fontWeight: FontWeight.bold,
//),
//),
//),
//Column(
//mainAxisAlignment: MainAxisAlignment.end,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Padding(
//padding:  EdgeInsets.only(top:300),
//child: Container(
//alignment: Alignment.bottomCenter,
//height: 60,
//width: 250,
//child: Material(
//borderRadius: BorderRadius.circular(1000),
//shadowColor: Colors.tealAccent,
//color: Colors.teal,
//elevation: 7.0,
//child: FlatButton(
//onPressed: () {
//Navigator.push(
//context, MaterialPageRoute(builder: (context) => AddMedicine()));
//},
//child: Center(
//child: Text(
//"Add a Med",
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold,
//fontFamily: "Monster",
//fontSize: 20.0,
//
//),
//),
//)
//),
//),
//),
//),
//
//
//],
//),
//
//],
//),
//],
//),

//ScrollingDayCalendar(
//startDate: startDate,
//endDate: endDate,
//selectedDate: selectedDate,
//onDateChange: (direction, DateTime selectedDate) {
//setState(() {
//pageItems = widgetBuilder(selectedDate);
//});
//},
//dateStyle: TextStyle(
//fontWeight: FontWeight.bold,
//color: Colors.white,
//),
//displayDateFormat: "dd MMM, yyyy",
//dateBackgroundColor: Colors.grey,
//forwardIcon: Icons.arrow_forward,
//backwardIcon: Icons.arrow_back,
//pageChangeDuration: Duration(
//milliseconds: 200,
//),
//pageItems: pageItems,
//widgets: widgets,
//widgetKeyFormat: widgetKeyFormat,
//noItemsWidget: Center(
//child: Padding(
//padding: EdgeInsets.only(bottom: 30),
//child: Column(
//mainAxisAlignment: MainAxisAlignment.end,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Container(
//alignment: Alignment.bottomCenter,
//height: 60,
//width: 250,
//child: Material(
//borderRadius: BorderRadius.circular(1000),
//shadowColor: Colors.tealAccent,
//color: Colors.teal,
//elevation: 7.0,
//child: FlatButton(
//onPressed: () {
//Navigator.push(
//context, MaterialPageRoute(builder: (context) => AddMedicine()));
//},
//child: Center(
//child: Text(
//"Add a Med",
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold,
//fontFamily: "Monster",
//fontSize: 20.0,
//
//),
//),
//)
//),
//),
//),
//
//],
//),
//),
//)
//
//),














//
//Container(
//child: Column(
//children: <Widget>[
//Column(
//children: <Widget>[
//Padding(
//padding: EdgeInsets.only(right: 320),
//child:
//Text(
//"Time",
//style: TextStyle(
//color: Colors.teal,
//fontSize: 15.0,
//fontWeight: FontWeight.bold,
//)
//),
//),
//Container(
//padding: EdgeInsets.only(top:0, left: 25, right: 25),
//child: Row(
//children: <Widget>[
//Expanded(
//flex: 2,
//child: Padding(
//padding: EdgeInsets.only(bottom: 17, ),
//child: TextFormField(
//validator: (input) {
//if (input.isEmpty) {
//return 'Please type the Time';
//}
//},
//onSaved: (input) => _startingTime = input,
//decoration: InputDecoration(
//hintText: "Time (Hours:Minutes)",
//hintStyle: TextStyle(
//fontFamily: "Monster",
//fontWeight: FontWeight.bold,
//color: Colors.grey,
//),
//focusedBorder: UnderlineInputBorder(
//borderSide: BorderSide(color: Colors.teal),),
//
//)
//),
//),
//),
//SizedBox(
//width: 20.0,
//),
//Expanded(
//flex: 1,
//child: Padding(
//padding: EdgeInsets.only(top: 0, left: 0),
//child: DropdownButton<String>(
//underline: Container(
//height: 2,
//color: Colors.teal,
//),
//hint: Text('AM/PM?'),
//value: _startingTimeType,
//items: [
//DropdownMenuItem<String>(
//child:Text('AM', style: TextStyle(color: Colors.blueGrey),
//),
//value: 'One'
//),
//DropdownMenuItem<String>(
//child:Text('PM', style: TextStyle(color: Colors.blueGrey ),
//),
//value: 'Two'
//),
//],
//onChanged: (String newValue) {
//setState(() {
//_startingTimeType = newValue;
//});
//},
//),
//),
//),
//],
//
//),
//)
//
//],
//),
//],
//)
//),
























//                SizedBox(
//                  height: 15,
//                ),

//                Padding(
//                  padding: EdgeInsets.only(right: 200),
//                  child: Text(
//                      "Days from Today",
//                      style: TextStyle(
//                        color: Colors.black,
//                        fontSize: 20.0,
//                        fontWeight: FontWeight.bold,
//
//                      )
//                  ),
//                ),
//                Container(
//                  padding: EdgeInsets.only(right:300),
//                  child:  DropdownButton<int>(
//                    underline: Container(
//                      height: 2,
//                      color: Colors.teal,
//                    ),
//                    hint: Text(
//                      'Days',
//                      style: TextStyle(
//                          color: Colors.grey
//                      ),
//                    ),
//                    value: _timeFromToday,
//                    items: [
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('00', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 00
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('01', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 01
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('02', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 02
//
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('03' , style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 03
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('04', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 04
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('05', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 05
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('06', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 06
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('07', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 07
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('08', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 08
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('09', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 09
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('10', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 10
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('11', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 11
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('12', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 12
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('13', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 13
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('14', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 14
//
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('15' , style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 15
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('16', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 16
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('17', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 17
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('18', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 18
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('19', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 19
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('20', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 20
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('21', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 21
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('22', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 22
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('23', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 23
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('24', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 24
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('25', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 25
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('26', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 26
//
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('27' , style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 27
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('28', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 28
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('29', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 5
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('30', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 30
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('31', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 31
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('32', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 32
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('33', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 33
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('34', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 34
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('35', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 35
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('36', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 36
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('37', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 37
//
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('38' , style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 38
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('39', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 39
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('40', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 40
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('41', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 41
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('42', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 42
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('43', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 43
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('44', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 44
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('45', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 45
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('46', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 46
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('47', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 47
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('48', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 48
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('49', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 49
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('50', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 50
//
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('51' , style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 51
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('52', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 52
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('53', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 53
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('54', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 54
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('55', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 55
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('56', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 56
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('57', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 57
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('58', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 58
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('59', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 59
//                      ),
//                      DropdownMenuItem<int>(
//                          child: Row(
//                            children: <Widget>[
//                              Text('60', style: TextStyle(color: Colors.black),
//                              ),
//
//                            ],
//                          ),
//                          value: 60
//                      )
//                    ],
//                    onChanged: (int newValue) {
//                      setState(() {
//                        _timeMinutes = newValue;
//                      });
//                    },
//                  ),
//                ),