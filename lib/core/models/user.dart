import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final DateTime creationTime;
  final String displayName;
  final String email;
  final String uid;

  User({
    required this.creationTime,
    required this.displayName,
    required this.email,
    required this.uid,
  });

  // Factory constructor to create a User from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      creationTime: json['creationTime'] is Timestamp
          ? (json['creationTime'] as Timestamp).toDate()
          : DateTime.parse(json['creationTime']),
      displayName: json['displayName'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  // Method to convert a User to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'creationTime': creationTime.toIso8601String(),
      'displayName': displayName,
      'email': email,
      'uid': uid,
    };
  }
}
