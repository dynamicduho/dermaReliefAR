import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference _doctorsCollection = Firestore.instance.collection('Doctors');


  get doctorsName => doctorsName;
  get phoneNumber => phoneNumber;
  get emailID => emailID;
  get doctorAddress => doctorAddress;
  get speciality => speciality;



  Future<void> doctorData(String doctorsName,String speciality, String phoneNumber, String emailID,
      String doctorAddress,timeDatabase, String uid) async {
    return await _doctorsCollection.document().setData({

      "Doctor Name": doctorsName,
      "Doctor Speciality": speciality,
      "Phone Number": phoneNumber,
      "Email ID": emailID,
      "Address": doctorAddress,
      "Create Time Database": timeDatabase,
      "uid": uid,


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


