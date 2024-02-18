import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_app/body_of_form.dart';
import 'package:form_app/student_list_page.dart';

class mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Registration App"),
      ),
      body: Column(
        children: [
          InkWell(
            child: Container(
              margin: EdgeInsets.all(14.0),
              height: 160,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("New Here!", style: TextStyle(fontSize:25, color: Colors.white),),
                  ),
                  // SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Click here to add your identity as a student in our institution. By adding your identity make sure to visit our 'Student List Page' from the home screen.",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => createStudent() ));
            },
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(14.0),
              height: 160,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("All  Students!", style: TextStyle(fontSize:25, color: Colors.white),),
                  ),
                  // SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Check your identity clicking here, make sure to ckeck your name and spellings. If require any corrections contact to the office imediatlly.",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => studentsList() ));
            },
          ),
        ],
      ),
    );
  }

}