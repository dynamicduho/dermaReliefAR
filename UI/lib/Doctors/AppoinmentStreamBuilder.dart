// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:healthreminders/Doctors/Models/BuildListAppointmentsHomePage.dart';
// import 'package:healthreminders/Models/User.dart';
// import 'package:provider/provider.dart';

// Widget appointmentStreamBuilder(BuildContext context) {
//   final user = Provider.of<User>(context);

//   return StreamBuilder<QuerySnapshot>(
//       stream:  Firestore.instance.collection('Appointments')
//           .where('uid', isEqualTo: user.uid)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData)
//           return Text(
//                   'Fetching your Appointments...',
//               );

//         return Expanded(
//           child: SizedBox(
//             height: 700,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: snapshot.data.documents.length,
//               itemBuilder: (context, index) =>
//                   buildListItemAppointmentsHomePage(
//                       context,
//                       snapshot.data.documents[index]),

//             ),
//           ),
//         );
//       }
//   );
// }
