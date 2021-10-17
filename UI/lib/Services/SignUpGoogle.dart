import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  } catch (e) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
            title: Center(child: Text('Action Failed')),
            titleTextStyle: TextStyle(
              color: Colors.teal,
              fontFamily: 'Monster',
              fontSize: 20.0,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            content: Column(
              children: <Widget>[
                Text(
                    'Are you sure you are not trying to sign up or sign in with a email ID that already has a account'),
              ],
            ),
            contentTextStyle: TextStyle(
              fontFamily: 'Monster',
              color: Colors.black,
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text('Try Again'),
              )
            ],
          );
        });
  }
  return null;
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
