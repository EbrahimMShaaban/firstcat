import 'package:firstcat/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant/fieldone.dart';
import 'constant/loginbuton.dart';
import 'homepage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  final TextEditingController? nameController = TextEditingController();

  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? copasswordController = TextEditingController();

  final TextEditingController? phoneController = TextEditingController();

  final TextEditingController? emailController = TextEditingController();

  String name = '';
  String password = '';
  String copassword = '';
  String email = '';
  String? num;

  bool? newuser;
save(String email , String pass)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('login', false);
  prefs.setString('email', email);
  prefs.setString('password', pass);
  print('success');
}
  get()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('email')) ;
    print(prefs.getString('password' ));
    print('success');



  }

  // @override
  // void initState() {
  //   super.initState();
  //   checklogin();
  // }

//TODO : اطبع جملة بعد معمل register

  // void checklogin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   newuser = (prefs.getBool('login') ?? true);
  //   debugPrint(newuser.toString());
  //   if (newuser == false &&
  //       password == prefs.get('email') &&
  //       email == prefs.get('password')) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const Home(),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Register To Music Festival ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: sizeFromHeight(context, 20)),
                InputFieldRegist(
                  //onTap: () {},
                  controller: nameController!,
                  label: 'Full Name',
                  scure: false,
                  validator: (value) {
                    name = value;
                    if (value!.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                  },
                ),
                InputFieldRegist(
                  //onTap: () {},
                  controller: emailController!,
                  label: 'Email',
                  scure: false,
                  validator: (value) {
                    email = value;
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                  },
                ),
                InputFieldRegist(
                  //onTap: () {},
                  controller: phoneController!,
                  label: 'Mobile Number',
                  scure: false,
                  validator: (value) {
                    num = value;
                    if (value!.isEmpty) {
                      return 'Please Enter Your Mobile Number';
                    }
                  },
                ),
                InputFieldRegist(
                  //onTap: () {},
                  controller: passwordController!,
                  label: 'Password',
                  scure: true,
                  validator: (value) {
                    password = value;
                    if (value!.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                  },
                ),
                InputFieldRegist(
                  //onTap: () {},
                  controller: copasswordController!,
                  label: 'Confirm Password',
                  scure: true,
                  validator: (value) {
                    copassword = value;
                    if (copassword != password) {
                      return 'password does not match...Please Rewrite Your Password correctly';
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Buton(
                  onTap: () {
                    // prefs!.setString('email', emailController!.text);
                    // print(emailController!.text);
                    //
                    // print( prefs!.getString('email'));

                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      save(emailController!.text, passwordController!.text);
                      get();


                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    }
                  },
                  text: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
