import 'package:e_commerce/core/route/route_path.dart';
import 'package:e_commerce/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:e_commerce/features/layout/business_logic/layout_states.dart';
import 'package:e_commerce/features/products/business_logic/cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart,
      ),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      label: 'Profile',
    ),
  ];
  void ChangeBottomNavBar(index) {
    currentIndex = index;

    emit(AppBottomNavState());
  }

  List<Widget> Screens = [
    BlocProvider(
      create: (context) => ProductsCubit()
        ..getBestSellingProducts()
        ..getCategory(),
      child: HomeScreen(),
    ),
    BlocProvider(
      create: (context) => CartCubit()..getAllProduct(),
      child: CartScreen(),
    ),
    BlocProvider(
      create: (context) => ProductsCubit()
        ..getBestSellingProducts()
        ..getCategory(),
      child: HomeScreen(),
    ),
  ];
}
