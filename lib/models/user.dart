// doubts na refre this " Nitish Kumar Singh youtube channel."

import 'package:practice_app/models/user_dob.dart';
import 'package:practice_app/models/user_location.dart';
import 'package:practice_app/models/user_name.dart';
import 'package:practice_app/models/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName userName;
  final UserDob userDob;
  final UserLocation userLocation;
  final UserPicture userPicture;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.userName,
    required this.userDob,
    required this.userLocation,
    required this.userPicture,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e["name"]);

    final dob = UserDob.fromMap(e["dob"]);

    final location = UserLocation.fromMap(e["location"]);

    final picture = UserPicture.fromMap(e["picture"]);

    return User(
      gender: e["gender"],
      email: e["email"],
      phone: e["phone"],
      cell: e["cell"],
      nat: e["nat"],
      userName: name,
      userDob: dob,
      userLocation: location,
      userPicture: picture,
    );
  }
}


