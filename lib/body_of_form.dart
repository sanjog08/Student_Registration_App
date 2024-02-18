import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';


class createStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Form"),
      ),
      body: FormBody(),
    );
  }

}

class FormBody extends StatefulWidget {
  @override
  State<FormBody> createState() => _FormBodyState();
}



class _FormBodyState extends State<FormBody> {

  final hostel = "http://192.168.1.8:8000/student";
  final home = "http://192.168.29.117:8000/student";
  StudentModel? _studentModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  Future<StudentModel?> submitData() async {
    try {
      var response = await http.post(
        Uri.parse(home),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': nameController.text,
          'email': emailController.text,
          'phone': int.parse(phoneController.text),
          'address': addressController.text,
        }),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        // Assuming studentModelFromJson function is correctly defined elsewhere
        String responseString = response.body;
        return studentModelFromJson(responseString);
      } else {
        print("Check the validator!");
        return null;
      }
    } catch (e) {
      print('Error submitting data: $e');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                controller: nameController,
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                controller: emailController,
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
                controller: phoneController,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
                controller: addressController,
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  submitData();
                  String name1 = nameController.text;
                  print(name1);
                  print(nameController.text);
                },
                child: const Text('Submit Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}