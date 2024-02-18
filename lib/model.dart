// // To parse this JSON data, do
// //
// //     final studentModel = studentModelFromJson(jsonString);
//
// import 'dart:convert';
//
// StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));
//
// String studentModelToJson(StudentModel data) => json.encode(data.toJson());
//
// class StudentModel {
//   String name;
//   String email;
//   String phone;
//   String address;
//
//   StudentModel({
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.address,
//   });
//
//   factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
//     name: json["name"],
//     email: json["email"],
//     phone: json["phone"],
//     address: json["address"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "email": email,
//     "phone": phone,
//     "address": address,
//   };
// }




// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  String id;
  String name;
  String email;
  int phone;
  String address;

  StudentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    id: json['_id'],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
  };
}
