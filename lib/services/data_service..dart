import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taptik_business_app/models/BusinessType.dart';

class Services {
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
}
