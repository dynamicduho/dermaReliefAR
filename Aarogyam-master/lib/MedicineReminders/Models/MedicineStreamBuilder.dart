// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:healthreminders/MedicineReminders/Models/BuildListMedicineHomePage.dart';
// import 'package:healthreminders/Models/User.dart';
// import 'package:provider/provider.dart';

// Widget medicineStreamBuilder(BuildContext context) {
//   final user = Provider.of<User>(context);

//   return Column(
//     children: <Widget>[
//       StreamBuilder<QuerySnapshot>(
//           stream:  Firestore.instance.collection('Medicines')
//               .where('uid', isEqualTo: user.uid)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData)
//               return Padding(
//                   padding: EdgeInsets.only(
//                       top: 250, left: 75),
//                   child: Text(
//                       'Fetching your Reminders...',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20.0,
//                       )
//                   )
//               );

//             return Expanded(
//               child: SizedBox(
//                 height: 700,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: snapshot.data.documents.length,
//                   itemBuilder: (context, index) =>
//                       buildListItemMedicineHomePage(
//                           context,
//                           snapshot.data.documents[index]),

//                 ),
//               ),
//             );
//           }
//       ),
//     ],
//   );

// }
