import 'package:firstcat/style.dart';
import 'package:flutter/material.dart';

class Loginoption extends StatelessWidget {
   Loginoption({required this.option}) ;
  String? option;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),

          child: Row(
            children:  [
              Image(
                  image: AssetImage("assets/$option.png", ),
                  height: sizeFromHeight(context, 19),
                  width: sizeFromWidth(context, 7),
              ),
               Text(
                 '$option',
                 style: const TextStyle(
                   fontSize: 20,
                   color: Colors.black,
                 ),
               )
            ],
          ),
        ));
  }
}
