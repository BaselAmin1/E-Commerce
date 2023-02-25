import 'package:e_commerce/core/route/route_path.dart';
import 'package:e_commerce/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/screens/register_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    AppRouter();

    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );
      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: RegisterScreen(),
          ),
        );
    }
    return null;
  }
}
