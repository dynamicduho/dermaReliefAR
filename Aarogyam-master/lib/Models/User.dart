import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;


class User {

  final String uid;

  User({ this.uid });

}






Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final uid = user.uid;
  print(uid);
  return uid.toString();
}