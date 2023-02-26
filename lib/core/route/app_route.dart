import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/route/route_path.dart';
import 'package:e_commerce/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/layout/presentation/screens/app_layout.dart';
import 'package:e_commerce/features/products/presentation/screens/home_screen.dart';
import 'package:e_commerce/features/products/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/products/business_logic/cubit/products_cubit.dart';

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
        case appLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => const AppLayout(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProductsCubit()
              ..getCategory()
              ..getBestSellingProducts(),
            child: HomeScreen(),
          ),
        );
      case productDetailsScreen:
        final index = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProductsCubit()..getBestSellingProducts(),
            child: ProductDetailsScreen(index: index),
          ),
        );
    }
    return null;
  }
}
