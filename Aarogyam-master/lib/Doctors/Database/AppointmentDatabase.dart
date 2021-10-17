import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference _appointmentsCollection = Firestore.instance.collection('Appointments');


  get doctorsName => doctorsName;
  get appointmentReason => appointmentReason;
  get doctorAddress => doctorAddress;
  get time => time;
  get timeType => timeType;
  get dayAppointment => dayAppointment;
  get dateAppointment => dateAppointment;


  Future<void> appointmentData(String doctorsName,String appointmentReason, String doctorAddress, int timeHours, int timeMinutes, String timeType, String dayAppointment,int dateAppointment, int monthAppointment,int yearAppointment, timeDatabase, String uid, int id, int id2) async {
    return await _appointmentsCollection.document().setData({

      "Doctor Name": doctorsName,
      "Appointment Details": appointmentReason,
      "Address": doctorAddress,
      "Time Hours": timeHours,
      "Time Minutes": timeMinutes,
      "Time Type": timeType,
      "Day of Appointment": dayAppointment,
      "Date of Appointment": dateAppointment,
      "Month of Appointment": monthAppointment,
      "Year of Appointment": yearAppointment,
      "Create Time Database": timeDatabase,
      "uid": uid,
      "id": id,
      "id2": id2,






  });
  }
//  List<Names> _brewListFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc){
//      //print(doc.data);
//      return Names(
//        name: doc.data['Name'] ?? '',
//        email: doc.data['Email'] ?? '',
//      );
//    }).toList();
//  }
//
//  // user data from snapshots
//  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//    return UserData(
//      uid: uid,
//      name: snapshot.data['name'],
//      email: snapshot.data['Email'],
//    );
//  }

}

//class Names {
//  final String name;
//  final String email;
//
//
//  Names({ this.name, this.email });
//
//}


