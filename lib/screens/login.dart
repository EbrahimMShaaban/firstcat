import 'package:firstcat/screens/register.dart';
import 'package:firstcat/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant/fieldone.dart';
import 'constant/loginbuton.dart';
import 'constant/loginoption.dart';
import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  SharedPreferences? sharedPreferences;
  bool newuser = true;

  @override
  void initState() {
    super.initState();
    checklog();
  }

  void checklog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    newuser = (prefs.getBool('login') ?? true);

    if (newuser == false) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }
  }

  void checklogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

      newuser = (prefs.getBool('login') ?? true);
      email = prefs.getString('email')!;
      password = prefs.getString('password')!;


    debugPrint(newuser.toString());
    debugPrint(email.toString());
    debugPrint(password.toString());
    if (newuser == false &&
        emailController.text == prefs.getString('email') &&
        passwordController.text == prefs.getString('password')) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }
  }

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: sizeFromHeight(context, 17),
                  ),
                  const Center(
                      child: CircleAvatar(backgroundImage: AssetImage( "assets/logo.png"),radius:40,)),
                  SizedBox(
                    height: sizeFromHeight(context, 8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Loginoption(
                        option: 'facebook',
                      ),
                      Loginoption(
                        option: 'google',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sizeFromHeight(context, 14),
                  ),
                  const Center(
                      child: Text(
                    'Or',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )),
                  InputFieldRegist(
                    // onTap: (value) {
                    //   // setState(() {
                    //   //   email = value;
                    //   // });
                    // },
                    controller: emailController,
                    label: 'Email ID',
                    scure: false,
                    validator: (value) {
                      email = value;
                      if (value!.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                    },
                  ),
                  InputFieldRegist(
                    // onTap: (value) {
                    //   // setState(() {
                    //   //   password=value;
                    //   // });
                    // },
                    controller: passwordController,
                    label: 'Password',
                    scure: true,
                    validator: (value) {
                      password = value;
                      if (value!.isEmpty) {
                        return 'Please Enter Your password';
                      }
                    },
                  ),
                  SizedBox(
                    height: sizeFromHeight(context, 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: sizeFromHeight(context, 30),
                  ),
                  Buton(
                    onTap: () {
                      //todo: check login with email , pass & true or false ;

                      checklogin();
                      // String email = emailController.text;
                      // String password = passwordController.text;
                      //
                      // if (email != '' && password != '') {
                      //   sharedPreferences!.setBool('login', false);
                      //   sharedPreferences!.setString('email', email);
                      //   sharedPreferences!.setString('password', password);
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const Home(),
                      //     ),
                      //   );
                      // }
                    },
                    text: 'LOGIN',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t Have any account ?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
