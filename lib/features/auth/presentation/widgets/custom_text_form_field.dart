import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final String? Function(String?)? onChange;
  final String? Function(String?)? validator;

  const CustomTextFormField(
    this.text,
    this.hint,
    this.onChange,
    this.validator, {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14.sp,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          onChanged: onChange,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}