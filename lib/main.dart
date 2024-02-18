import 'package:flutter/material.dart';
import 'package:form_app/main_page.dart';

import 'body_of_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MongoDB Database' ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Color(0xFFEEEEEE),
      ),
      home: mainpage(),
    );
  }
}


class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: FormBody(),
    );
  }

}