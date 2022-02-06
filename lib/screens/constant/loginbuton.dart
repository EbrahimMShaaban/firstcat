// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../style.dart';
class Buton extends StatelessWidget {
  final String text;
  final Function onTap;
  const Buton({required this.onTap,required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () =>onTap(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15,
          ),
          height: sizeFromHeight(context, 13),
          width:  double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.orangeAccent,

          ),
          child: Text(
            text,

            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ));
  }
}
