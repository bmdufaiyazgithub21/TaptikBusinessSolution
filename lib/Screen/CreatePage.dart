import 'package:flutter/material.dart';
import '../models/AddBusiness.dart';
import '../models/BusinessType.dart'; // Ensure correct import of Businesstype
import '../services/data_service..dart';


class Createpage extends StatefulWidget {
  const Createpage({super.key});

  @override
  _CreatepageState createState() => _CreatepageState();
}

class _CreatepageState extends State<Createpage> {
  final TextEditingController _OwnerNameController = TextEditingController();
  final TextEditingController _BusinessNameController = TextEditingController();
  final TextEditingController _MobileNumberController = TextEditingController();
  final TextEditingController _CityController = TextEditingController();
  final TextEditingController _StateController = TextEditingController();
  final TextEditingController _ZipController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _selectedBusinessType;
  List<Businesstype> _businessTypes = [];
  // To store the fetched business owner data
  AddBusiness? _businessOwner;

  @override
  void initState() {
    super.initState();
    _fetchBusinessTypes();
    _fetchBusinessOwner();
  }

  // Fetching business types from the API
  Future<void> _fetchBusinessTypes() async {
    await Future.delayed(Duration(seconds: 2));
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
  // Function to fetch business owner details after adding
  Future<void> _fetchBusinessOwner() async {
    // Simulating the API call, replace this with your actual API service call.
    await Future.delayed(Duration(seconds: 2));
    final responseJson = {
      "data": {
        "industry_id": 1,
        "owner_name": "Name",
        "business_name": "Business Name",
        "business_mobile": 9005249542,
        "city": "City",
        "state": "State",
        "zip": "Pincode",
        "created_at": "05-Feb-2025 08:14:29 PM (5 hours ago)",
        "id": 2,
      }
    };

    // Parsing JSON to AddBusiness model
    final businessOwner = AddBusiness.fromJson(responseJson);
    setState(() {
      _businessOwner = businessOwner;
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
        child: SingleChildScrollView(
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
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _OwnerNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    labelText: _businessOwner != null
                        ? _businessOwner!.ownerName
                        : 'Loading...', // Use a fallback while the data loads
                    hintText: 'Enter owner name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _BusinessNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    labelText: _businessOwner != null
                        ? _businessOwner!.businessName
                        : 'Loading...', // Use a fallback while the data loads
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    labelText: _businessOwner != null
                        ? _businessOwner!.businessMobile.toString()
                        : 'Loading...', // Use a fallback while the data loads
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _CityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    labelText: _businessOwner != null
                        ? _businessOwner!.city
                        : 'Loading...', // Use a fallback while the data loads
                    hintText: 'Enter city name',
                    prefixIcon: Icon(Icons.location_city_rounded),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _StateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    labelText: _businessOwner != null
                        ? _businessOwner!.state
                        : 'Loading...', // Use a fallback while the data loads
                    hintText: 'Enter state name',
                    prefixIcon: Icon(Icons.home),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _ZipController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    labelText: _businessOwner != null
                        ? _businessOwner!.zip
                        : 'Loading...', // Use a fallback while the data loads
                    hintText: 'Enter zip name',
                    prefixIcon: Icon(Icons.pin),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pop(
                        context,
                        {
                          'businessType': _selectedBusinessType.toString(),
                          'OwnerName': _OwnerNameController.text,
                          'businessName': _BusinessNameController.text,
                          'mobileNumber': _MobileNumberController.text,
                          'city':_CityController.text,
                          'state':_StateController.text,
                          'zip':_ZipController.text,
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
      ),
    );
  }
}
