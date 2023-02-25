import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final Function()? onPress;

  const CustomButton({super.key, 
    required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
    style: ElevatedButton.styleFrom(
                backgroundColor:primaryColor,
               // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(
              //  fontSize: 30,
                //fontWeight: FontWeight.bold
                )),
     
      child: CustomText(
        alignment: Alignment.center,
        text: text,
        color: Colors.white,
      ),
    );
  }
}