// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:taptik_business_app/models/BusinessType.dart';
//
// class Services {
//   Future<List<Businesstype>> getData() async {
//     List<Businesstype> businessTypes = [];
//     try {
//       final response = await http.get(Uri.parse('https://stage-admin.taptik.in/api/v1/get-business-type'));
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List<dynamic> businessTypeData = data['data'];
//         print("Business Type Data: $businessTypeData");
//         businessTypes = businessTypeData.map((json) => Businesstype.fromJson(json)).toList();
//       } else {
//         print('Error Occurred');
//       }
//     } catch (e) {
//       print('Error Occurred: ' + e.toString());
//     }
//     return businessTypes;
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/BusinessType.dart';

class Services {
  // Existing getData method for business types
  Future<List<Businesstype>> getData() async {
    List<Businesstype> businessTypes = [];
    try {
      final response = await http.get(Uri.parse('https://stage-admin.taptik.in/api/v1/get-business-type'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> businessTypeData = data['data'];
        print("Business Type Data: $businessTypeData");
        businessTypes = businessTypeData.map((json) => Businesstype.fromJson(json)).toList();
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred: ' + e.toString());
    }
    return businessTypes;
  }

  // Add business owner via POST request
  Future<bool> addBusinessOwner({
    required int businessType,
    required String ownerName,
    required String businessName,
    required int businessMobile,
    required String city,
    required String state,
    required String pin,
  }) async {
    final url = 'https://stage-admin.taptik.in/api/v1/add-business-owner';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'business_type': businessType,
        'owner_name': ownerName,
        'business_name': businessName,
        'business_mobile': businessMobile,
        'city': city,
        'state': state,
        'pin': pin,
      }),
    );

    if (response.statusCode == 200) {
      print('Business Owner added successfully');
      return true;
    } else {
      print('Error occurred while adding business owner');
      return false;
    }
  }
}
