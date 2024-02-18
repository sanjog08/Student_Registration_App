import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'model.dart';


class studentsList extends StatefulWidget {

  @override
  State<studentsList> createState() => _studentsListState();
}

class _studentsListState extends State<studentsList> {
  List<StudentModel?> students_list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Students"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemCount: students_list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // leading: ,
                    title: Text('Name: ${students_list[index]?.name}', style: TextStyle(fontSize: 18),),
                    subtitle: Text('Phone: ${students_list[index]?.phone}', style: TextStyle(fontSize: 16),),
                    trailing: IconButton(
                      iconSize: 25,
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // delete function will be call here
                        print("deleting  (${students_list[index]?.name})...........");
                        deletestudent(students_list[index]!.id);
                      },
                    ),
                  );
                },
              separatorBuilder: (BuildContext context, int index) {
                  return Divider(thickness: 1,);
                  },
            );
          }
          else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

  final hostel = "http://192.168.1.8:8000/students";
  final home = "http://192.168.29.117:8000/students";

  Future<List<StudentModel?>> getData() async {
    final response = await http.get(Uri.parse(home));
    var data =  jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        students_list.add(StudentModel.fromJson(index));
      }
      return students_list;
    }
    else {
      return students_list;
    }
  }


  Future<void> deletestudent(String id) async {
    final deletehome = "http://192.168.29.117:8000/delstudents/${id}";
    try {
      final response = await http.delete(Uri.parse(deletehome));
      if (response.statusCode == 200) {
        print('Item deleted successfully');
      } else {
        print('Failed to delete item. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error deleting item: $e');
    }
  }

}