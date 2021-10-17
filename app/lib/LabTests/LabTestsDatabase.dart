import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference _labTestCollection = Firestore.instance.collection('LabTests');


  get labtestName => labtestName;
  get labtestAddress => labtestAddress;
  get time => time;
  get timeType => timeType;
  get reasonLabTest => reasonLabTest;
  get dayLabTest => dayLabTest;
  get dateLabTest => dateLabTest;


  Future<void> labTestData(String labtestName,String labtestAddress, int timeHours, int timeMinutes, String timeType, String reasonLabTest, String dayLabTest,int dateLabTest,int monthLabTest, int yearLabTest, timeDatabase, String uid, int id, int id2) async {
    return await _labTestCollection.document().setData({

      "Lab Tests Name": labtestName,
      "Address of Lab Test": labtestAddress,
      "Time Hours": timeHours,
      "Time Minutes": timeMinutes,
      "Time Type": timeType,
      "Reason for Lab Test": reasonLabTest,
      "Day of Lab Test": dayLabTest,
      "Date of Lab Test": dateLabTest,
      "Month of Lab Test": monthLabTest,
      "Year of Lab Test": yearLabTest,
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


