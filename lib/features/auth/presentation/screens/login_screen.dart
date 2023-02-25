import 'package:e_commerce/core/route/route_path.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_button_social.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              right: 20.w,
              left: 20.w,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Welcome,",
                        fontSize: 30.sp,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, registerScreen);
                        },
                        child: CustomText(
                          text: "Sign Up",
                          color: primaryColor,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    text: 'Sign in to Continue',
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextFormField(
                    'Email',
                    'iamdavid@gmail.com',
                    (value) {
                      email = value;
                    },
                    (value) {
                      if (value!.isEmpty) return 'email must be filled';
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    'Password',
                    '**********',
                    (value) {
                      password = value;
                    },
                    (value) {
                      if (value!.isEmpty) return 'email must be filled';
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text: 'Forgot Password?',
                    fontSize: 14.sp,
                    alignment: Alignment.topRight,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                    onPress: () {
                      _formKey.currentState!.save();

                      if (_formKey.currentState!.validate()) {
                        cubit.signInWithEmail(context, email, password);
                      }
                    },
                    text: 'SIGN IN',
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomText(
                    text: '-OR-',
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButtonSocial(
                    text: 'Sign In with Facebook',
                    onPress: () {
               
                        cubit.signInWithFacebook(context);
                      
                    },
                    imageName: 'assets/images/facebook.png',
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButtonSocial(
                    text: 'Sign In with Google',
                    onPress: () {
                     
                        cubit.signInWithGoogle(context);
                      
                    },
                    imageName: 'assets/images/google.png',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
