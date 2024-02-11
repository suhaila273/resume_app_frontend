// To parse this JSON data, do
//
//     final resume = resumeFromJson(jsonString);

import 'dart:convert';

List<Resume> resumeFromJson(String str) => List<Resume>.from(json.decode(str).map((x) => Resume.fromJson(x)));

String resumeToJson(List<Resume> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Resume {
  UserId userId;
  String profile;
  String education;
  String skills;
  String achievments;
  String certifications;
  DateTime postedDate;

  Resume({
    required this.userId,
    required this.profile,
    required this.education,
    required this.skills,
    required this.achievments,
    required this.certifications,
    required this.postedDate,
  });

  factory Resume.fromJson(Map<String, dynamic> json) => Resume(
    userId: UserId.fromJson(json["userId"]),
    profile: json["profile"],
    education: json["education"],
    skills: json["skills"],
    achievments: json["achievments"],
    certifications: json["certifications"],
    postedDate: DateTime.parse(json["postedDate"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId.toJson(),
    "profile": profile,
    "education": education,
    "skills": skills,
    "achievments": achievments,
    "certifications": certifications,
    "postedDate": postedDate.toIso8601String(),
  };
}

class UserId {
  String username;
  String dob;
  String email;
  String phone;

  UserId({
    required this.username,
    required this.dob,
    required this.email,
    required this.phone,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    username: json["username"],
    dob: json["dob"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "dob": dob,
    "email": email,
    "phone": phone,
  };
}
