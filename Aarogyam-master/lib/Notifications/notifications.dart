// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:healthreminders/MainPages/Medicine.dart';
// //import 'package:healthreminders/Models/User.dart';
// import 'package:healthreminders/Models/Wrapper.dart';
// //import 'package:provider/provider.dart';

// final uid =  FirebaseAuth.instance.currentUser();

// class Notifications extends StatefulWidget {
//   @override
//   _NotificationsState createState() => _NotificationsState();
// }

// class _NotificationsState extends State<Notifications> {

// //  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   String medicineName;
//   String medicineType;
//   String medicineDosage;
//   int medicineInterval;
//   String medicineStartTime;

//   void getInfoMedicine () async{
//     var medicineDetails = Firestore.instance.collection('Medicines').where('uid',  isEqualTo: uid);
//     medicineDetails.getDocuments().then((data) {
//       if (data.documents.length > 0) {
//         setState(() {
//           medicineName = data.documents[0].data['Name'];
//           medicineType = data.documents[0].data['Type'];
//           medicineDosage = data.documents[0].data['Dosage'];
//           medicineInterval = data.documents[0].data['Interval'];
//           medicineStartTime = data.documents[0].data['Starting Time'];

//         }
//         );
//       }
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     var initializationSettingsAndroid =
//     new AndroidInitializationSettings('app_logo');
//     var initializationSettingsIOS = new IOSInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
// //      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//     var initializationSettings = new InitializationSettings(
//         initializationSettingsAndroid, initializationSettingsIOS);
//     flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);

//   }
//   Future onSelectNotification(String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: ' + payload);
//     }
//     await Navigator.push(
//       context,
//       new MaterialPageRoute(builder: (context) => Wrapper()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
// //    final user = Provider.of<User>(context);
//     return Scaffold();
//   }

//   Future<void> scheduleNotification(Medicine medicine) async {
//     var vibrationPattern = Int64List(4);
//     vibrationPattern[0] = 0;
//     vibrationPattern[1] = 1000;
//     vibrationPattern[2] = 5000;
//     vibrationPattern[3] = 2000;

//     var hour = int.parse(medicineStartTime[0] + medicineStartTime[1]);
//     var ogValue = hour;
//     var minute = int.parse(medicineStartTime[2] + medicineStartTime[3]);

//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'repeatDailyAtTime channel id',
//       'repeatDailyAtTime channel name',
//       'repeatDailyAtTime description',
//       importance: Importance.Max,
//       sound: RawResourceAndroidNotificationSound('notification'),
//       ledColor: Color(0xFF3EB16F),
//       ledOffMs: 1000,
//       ledOnMs: 1000,
//       enableLights: true,
//     );
//     var iOSPlatformChannelSpecifics = IOSNotificationDetails(sound: 'notification.aiff');
//     var platformChannelSpecifics = NotificationDetails(
//         androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

//     for (int i = 0; i < (24 / medicineInterval).floor(); i++) {
//       if ((hour + (medicineInterval * i) > 23)) {
//         hour = hour + (medicineInterval * i) - 24;
//       } else {
//         hour = hour + (medicineInterval * i);
//       }
//       await flutterLocalNotificationsPlugin.showDailyAtTime(
//            0,
//           'Medicine Reminder: $medicineName',
//           medicineType.toString() != medicineType.toString()
//               ? 'It is time to take your $medicineName, according to schedule'
//               : 'It is time to take your medicine, according to schedule',
//           Time(hour, minute, 0),
//           platformChannelSpecifics);
//       hour = ogValue;
//     }
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }
// }
