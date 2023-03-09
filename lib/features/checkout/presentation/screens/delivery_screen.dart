import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text.dart';
import 'package:e_commerce/features/checkout/business_logic/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
            var cubit = CheckoutCubit.get(context);

        return Column(children: [
          GestureDetector(
            onTap: () => cubit.changeDelivery(1),
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 340.w,
                    height: 90,
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Standard Delivery',
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                          alignment: Alignment.topLeft,
                        ),
                        CustomText(
                          text:
                              'Order will be delivered between 3 - 5 business days',
                          fontSize: 18.sp,
                          maxLine: 2,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.circle,
                    color:
                        cubit.deliveryChoice == 1 ? primaryColor : Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => cubit.changeDelivery(2),
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                children: [
                  Container(
                    width: 340.w,
                    height: 90,
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Next Day Delivery',
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                          alignment: Alignment.topLeft,
                        ),
                        CustomText(
                          text:
                              'Place your order before 6pm and your items will be delivered the next day',
                          fontSize: 18.sp,
                          maxLine: 2,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.circle,
                    color:
                        cubit.deliveryChoice == 2 ? primaryColor : Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => cubit.changeDelivery(3),
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                children: [
                  Container(
                    width: 340.w,
                    height: 90,
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Nominated Delievery',
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                          alignment: Alignment.topLeft,
                        ),
                        CustomText(
                          text:
                              'Pick a particular date from the calendar and order will be delivered on selected date',
                          fontSize: 18.sp,
                          maxLine: 2,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.circle,
                    color:
                        cubit.deliveryChoice == 3 ? primaryColor : Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }
}
