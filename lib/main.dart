import 'package:firstcat/screens/homepage.dart';
import 'package:firstcat/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

bool? user;



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    void checklogin() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      user = (prefs.getBool('login') ?? true);

      if (user == false) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: Colors.black),
            color: Theme.of(context).scaffoldBackgroundColor),
      ),
      home: const LoginScreen(),
    );
  }
}
