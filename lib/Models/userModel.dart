// To parse this JSON data, do
//
//     final useradd = useraddFromJson(jsonString);

import 'dart:convert';

List<Useradd> useraddFromJson(String str) => List<Useradd>.from(json.decode(str).map((x) => Useradd.fromJson(x)));

String useraddToJson(List<Useradd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Useradd {
  String username;
  String password;
  String dob;
  String email;
  String phone;

  Useradd({
    required this.username,
    required this.password,
    required this.dob,
    required this.email,
    required this.phone,
  });

  factory Useradd.fromJson(Map<String, dynamic> json) => Useradd(
    username: json["username"],
    password: json["password"],
    dob: json["dob"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "dob": dob,
    "email": email,
    "phone": phone,
  };
}
