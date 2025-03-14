import 'package:flutter/material.dart';

import 'app_color.dart';

typedef MyValidator = String? Function(String?);

class TextFormFieldItem extends StatelessWidget {
  String label;

  MyValidator validator;

  TextInputType keyboardType;

  TextEditingController controller;

  bool obscureText;

  TextFormFieldItem(
      {super.key,
      required this.label,
      required this.validator,
      this.keyboardType = TextInputType.text,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: AppColors.redColor, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: AppColors.redColor, width: 2)),
          labelText: label,
        ),
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
      ),
    );
  }
}
