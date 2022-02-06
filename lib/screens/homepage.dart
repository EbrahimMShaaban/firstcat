import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences? sharedPreferences;

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo.png"),
              backgroundColor: Colors.black,
              radius: 100),
        ),
      ),
    );
  }
}
