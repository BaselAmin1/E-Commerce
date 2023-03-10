import 'package:e_commerce/core/route/route_path.dart';
import 'package:e_commerce/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:e_commerce/features/checkout/business_logic/cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:e_commerce/features/layout/presentation/screens/app_layout.dart';
import 'package:e_commerce/features/products/presentation/screens/categories_screen.dart';
import 'package:e_commerce/features/products/presentation/screens/home_screen.dart';
import 'package:e_commerce/features/products/presentation/screens/product_details_screen.dart';
import 'package:e_commerce/features/products/presentation/screens/product_details_screen_bestselling.dart';
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
        case categoriesScreen:
      
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductsCubit()..getCategory(),
            child: CategoriesScreen(),
          ),
        );
        
      case productDetailsScreen:
        final index = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CartCubit(),
            child: ProductDetailsScreen(index: index,),
          ),
        );

        case productDetailsScreenBestSelling:
            final index = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CartCubit(),
            child: ProductDetailsScreenBestSelling(index: index,),
          ),
        );
      case cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CartCubit()..getAllProduct(),
            child: CartScreen(),
          ),
        );
      
        case cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CartCubit()..getAllProduct(),
            child: CartScreen(),
          ),
        );
        case checkOutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CheckoutCubit(),
            child: CheckOutScreen(),
          ),
        );
    }
    return null;
  }
}
