import 'package:flutter/material.dart';
import 'package:taptik_business_app/Screen/CreatePage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List to hold the added items
  List<Map<String, String>> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade200,
        title: Text(
          "Taptik Business App",
          style: TextStyle(fontSize: 21, fontFamily: 'Suwannaphum',fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: 'Search Items',
                hintText: 'Search your items',
                prefixIcon: Icon(Icons.filter_alt),
              ),
            ),
            SizedBox(height: 10),
            // Display the list of added items
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text("Business Type: ${item['businessType']}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("First Name: ${item['OwnerName']}"),
                          Text("Business Name: ${item['businessName']}"),
                          Text("Mobile Number: ${item['mobileNumber']}"),
                          Text("City Name: ${item['city']}"),
                          Text("State Name: ${item['state']}"),
                          Text("Zip Name: ${item['zip']}"),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_rounded, color: Colors.red.shade900),
                        onPressed: () {
                          // Remove the item from the list
                          setState(() {
                            items.removeAt(index); // Remove item at this index
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          // Navigate to Createpage and await the result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Createpage()),
          );

          if (result != null) {
            // Add the new item to the list and update the UI
            setState(() {
              items.add(result);
            });
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.greenAccent.shade700,
          size: 35,
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:taptik_business_app/Screen/ShowScreen.dart';
//
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   final TextEditingController _FirstNameController = TextEditingController();
//   final TextEditingController _BusinessNameController = TextEditingController();
//   final TextEditingController _MobileNumberController = TextEditingController();
//
//   // Add a GlobalKey for the form validation
//   final _formKey = GlobalKey<FormState>();
//
//   // List to store the data entered
//   List<Map<String, String>> _dataList = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple.shade200,
//         title: Text(
//           "Taptik Business App",
//           style: TextStyle(fontSize: 21),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Form to enter data
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: _FirstNameController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(12))),
//                       labelText: 'First Name',
//                       hintText: 'Enter your name',
//                       prefixIcon: Icon(Icons.person),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: _BusinessNameController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(12))),
//                       labelText: 'Business name',
//                       hintText: 'Enter your Business name',
//                       prefixIcon: Icon(Icons.business_center_outlined),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a business name';
//                       }
//                       return null; // Return null if valid
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: _MobileNumberController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(12))),
//                       labelText: 'Mobile number',
//                       hintText: 'Enter your Mobile number',
//                       prefixIcon: Icon(Icons.phone),
//                     ),
//                     keyboardType: TextInputType.phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your mobile number';
//                       } else if (value.length != 10) {
//                         return 'Please enter a valid 10-digit mobile number';
//                       }
//                       return null; // Return null if valid
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         // Validate form before adding data
//                         if (_formKey.currentState?.validate() ?? false) {
//                           setState(() {
//                             _dataList.add({
//                               'firstName': _FirstNameController.text,
//                               'businessName': _BusinessNameController.text,
//                               'mobileNumber': _MobileNumberController.text,
//                             });
//                           });
//
//                           // Clear the fields after adding
//                           _FirstNameController.clear();
//                           _BusinessNameController.clear();
//                           _MobileNumberController.clear();
//                         } else {
//                           // Show a message if the form is not valid
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Please fill all fields correctly')),
//                           );
//                         }
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.green.shade700,
//                             borderRadius: BorderRadius.circular(5)),
//                         width: 100,
//                         height: 40,
//                         child: Center(
//                           child: Text(
//                             "Add",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           // Display added data in ListView with delete option
//           Expanded(
//             child: ListView.builder(
//               itemCount: _dataList.length,
//               itemBuilder: (context, index) {
//                 var item = _dataList[index];
//                 return ListTile(
//                   title: Text(item['firstName'] ?? ''),
//                   subtitle: Text('Business: ${item['businessName']} | Mobile: ${item['mobileNumber']}'),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.arrow_forward),
//                         onPressed: () {
//                           // Navigate to ShowScreen to view details
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Showscreen(
//                                 firstName: item['firstName']!,
//                                 businessName: item['businessName']!,
//                                 mobileNumber: item['mobileNumber']!,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete, color: Colors.red),
//                         onPressed: () {
//                           // Remove the item from the list
//                           setState(() {
//                             _dataList.removeAt(index);
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
