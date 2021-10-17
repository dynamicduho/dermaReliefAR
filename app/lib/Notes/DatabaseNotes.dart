import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference _notesCollection = Firestore.instance.collection(
      'Notes');


  Future<void> notesData(String notes, String uid, timeDatabase) async {
    return await _notesCollection.document().setData({

      "Notes": notes,
      "Date and Time": timeDatabase,
      "uid": uid,


    });
  }

}