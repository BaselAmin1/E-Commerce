import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function()? onPress;

  const CustomButtonSocial({super.key, 
    required this.text,
    required this.imageName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        color: Colors.grey.shade50,
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade50,
            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: const TextStyle(
                //  fontSize: 30,
                //fontWeight: FontWeight.bold
                )),
        child: Row(
          children: [
            Image.asset(imageName),
            SizedBox(
              width: 100.w,
            ),
            CustomText(
              text: text,
              alignment: Alignment.centerLeft,
            ),
          ],
        ),
      ),
    );
  }
}
