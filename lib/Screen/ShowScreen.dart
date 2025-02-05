// import 'package:flutter/material.dart';
//
// class Showscreen extends StatelessWidget {
//   final String firstName;
//   final String businessName;
//   final String mobileNumber;
//
//   // Constructor to receive data from the Homepage
//   const Showscreen({
//     super.key,
//     required this.firstName,
//     required this.businessName,
//     required this.mobileNumber,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple.shade200,
//         title: Text("Second Page", style: TextStyle(fontSize: 21,fontFamily: 'Pacifico')),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 2.0,right: 2.0),
//               child: TextFormField(
//                 //controller: _FirstNameController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(12))),
//                   labelText: 'Filter Items',
//                   hintText: 'Filter your items',
//                   prefixIcon: Icon(Icons.filter_alt),
//                 ),
//                 // Add validation logic here (if needed for first name)
//               ),
//             ),
//             Text("First Name: $firstName", style: TextStyle(fontSize: 18)),
//             SizedBox(height: 10),
//             Text("Business Name: $businessName", style: TextStyle(fontSize: 18)),
//             SizedBox(height: 10),
//             Text("Mobile Number: $mobileNumber", style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }
