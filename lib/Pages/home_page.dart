import 'package:flutter/material.dart';
import 'package:practice_app/models/user.dart';
import 'package:practice_app/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchingUsersMethodFromServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Rest API Call',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final uesrIndex = users[index];

          final country = uesrIndex.userLocation.country;
          final fullName =
              "${uesrIndex.userName.title}. ${uesrIndex.userName.first} ${uesrIndex.userName.last}";

          return ListTile(
            title: Text(country),
            subtitle: Text(fullName),
          );
        },
      ),
    );
  }

  Future<void> fetchingUsersMethodFromServices() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
