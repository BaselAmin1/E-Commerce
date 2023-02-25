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

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email, password, name;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, loginScreen);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
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
                  CustomText(
                    text: "Sign Up,",
                    fontSize: 30.sp,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    'Name',
                    'Pesa',
                    (value) {
                      name = value!;
                    },
                    (value) {
                      if (value!.isEmpty) return 'email must be filled';
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextFormField(
                    'Email',
                    'iamdavid@gmail.com',
                    (value) {
                      email = value!;
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
                      password = value!;
                    },
                    (value) {
                      if (value!.isEmpty) return 'email must be filled';
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        cubit.registerWithEmail(context, email, password, name);
                      }
                    },
                    text: 'SIGN Up',
                  ),
                  SizedBox(
                    height: 40.h,
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
