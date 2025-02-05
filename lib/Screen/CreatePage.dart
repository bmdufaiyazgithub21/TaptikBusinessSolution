import 'package:flutter/material.dart';
import '../models/BusinessType.dart'; // Ensure correct import of Businesstype
import '../services/data_service..dart';


class Createpage extends StatefulWidget {
  const Createpage({super.key});

  @override
  _CreatepageState createState() => _CreatepageState();
}

class _CreatepageState extends State<Createpage> {
  final TextEditingController _FirstNameController = TextEditingController();
  final TextEditingController _BusinessNameController = TextEditingController();
  final TextEditingController _MobileNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _selectedBusinessType;
  List<Businesstype> _businessTypes = [];

  @override
  void initState() {
    super.initState();
    _fetchBusinessTypes();
  }

  // Fetching business types from the API
  Future<void> _fetchBusinessTypes() async {
    Services().getData().then((businessTypes) {
      setState(() {
        _businessTypes = businessTypes;
        if (_businessTypes.isNotEmpty) {
          _selectedBusinessType = _businessTypes[0].name;  // Set first value as selected
        }
      });
    }).catchError((e) {
      print("Error fetching business types: $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade200,
        title: Text(
          "Taptik Business App",
          style: TextStyle(fontSize: 21, fontFamily: 'Pacifico'),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _businessTypes.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : DropdownButtonFormField<String>(
                value: _selectedBusinessType,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  labelText: 'Business Type',
                  hintText: 'Select business type',
                  prefixIcon: Icon(Icons.business),
                ),
                items: _businessTypes.map((Businesstype businessType) {
                  return DropdownMenuItem<String>(
                    value: businessType.name,
                    child: Text(businessType.name),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedBusinessType = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a business type';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _FirstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  labelText: 'First Name',
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _BusinessNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  labelText: 'Business Name',
                  hintText: 'Enter your Business name',
                  prefixIcon: Icon(Icons.business_center_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a business name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _MobileNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  labelText: 'Mobile Number',
                  hintText: 'Enter your Mobile number',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  } else if (value.length != 10) {
                    return 'Please enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pop(
                      context,
                      {
                        'businessType': _selectedBusinessType.toString(),
                        'firstName': _FirstNameController.text,
                        'businessName': _BusinessNameController.text,
                        'mobileNumber': _MobileNumberController.text,
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all fields correctly')),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(5)),
                  width: 100,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
