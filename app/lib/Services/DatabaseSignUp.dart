import 'package:cloud_firestore/cloud_firestore.dart';




class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference nameCollection = Firestore.instance.collection('Users');

  Future<void> updateUserData (String name,String email, String uid, String phoneNumber,String weight,String height,String age,String bloodGroup, String gender) async {
    return await nameCollection.document(uid).setData({

      'Name': name,
      'Email': email,
      'Phone Number': phoneNumber,
      'uid': uid,
      'Weight': weight,
      'Height': height,
      'Age': age,
      'Blood Group': bloodGroup,
      'Gender': gender,

    });
  }
//  List<Profile> _profileListFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc){
//      //print(doc.data);
//      return Profile(
//          name: doc.data['Name'] ?? '',
//        email: doc.data['Email'] ?? '',
//        uid: doc.data['uid'] ?? '',
//
//        phoneNumber: doc.data['Phone Number'] ?? '',
//        weight: doc.data['Weight'] ?? '',
//        height: doc.data['Height'] ?? '',
//        age: doc.data['Age'] ?? '',
//        bloodGroup: doc.data['Blood Group'] ?? '',
//
//
//
//      );
//    }).toList();
//  }
//
  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(

      name: snapshot.data['Name'],
      email: snapshot.data['Email'],
      uid: snapshot.data['uid'],

      phoneNumber: snapshot.data['Phone Number'],
      weight: snapshot.data['Weight'],
      height: snapshot.data['Height'],
      age: snapshot.data['Age'],
      bloodGroup: snapshot.data['Blood Group'],
      gender: snapshot.data['Gender'],

    );
  }
  Stream<UserData> get userData {
    return nameCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
}

class Profile {
  final String name;
  final String email;
  final String uid;
  final String phoneNumber;
  final String weight;
  final String height;
  final String age;
  final String bloodGroup;
  final String gender;





  Profile({ this.name,this.email, this.uid, this.phoneNumber, this.weight,this.height, this.age, this.bloodGroup,this.gender });

}

class UserData {

  final String name;
  final String email;
  final String uid;
  final String phoneNumber;
  final String weight;
  final String height;
  final String age;
  final String bloodGroup;
  final String gender;





  UserData({ this.name, this.email, this.uid, this.phoneNumber, this.weight, this.height, this.age, this.bloodGroup,this.gender });

}