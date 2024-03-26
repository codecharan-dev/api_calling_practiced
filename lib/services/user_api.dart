import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice_app/models/user.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsonDecoder = jsonDecode(response.body);
    final results = jsonDecoder["results"] as List<dynamic>;
    final user = results.map(
      (e) {
        return User.fromMap(e);
      },
    ).toList();
    return user;
  }
}
