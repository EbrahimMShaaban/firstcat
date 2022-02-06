import 'package:flutter/material.dart';

class InputFieldRegist extends StatefulWidget {
  final String label;
  final bool scure;
  final TextEditingController controller;
  final FormFieldValidator validator;

   const InputFieldRegist({
    Key? key,

    required this.controller,
    required this.label,
    required this.scure,
    required this.validator,
  }) : super(key: key);

  @override

  _InputFieldRegistState createState() => _InputFieldRegistState();
}

class _InputFieldRegistState extends State<InputFieldRegist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
      child: TextFormField(
        // onTap: () =>widget.onTap(),
        controller: widget.controller,
        obscureText: widget.scure,
        validator: widget.validator,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          labelText: widget.label,
        ),
      ),
    );
  }
}
