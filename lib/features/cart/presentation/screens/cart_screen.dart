import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text.dart';
import 'package:e_commerce/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return cubit.cartProductModel.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/cart_empty.svg',
                    width: 200.w,
                    height: 200.h,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomText(
                    text: 'Cart Empty',
                    alignment: Alignment.center,
                    fontSize: 32.sp,
                  )
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return SizedBox(
                            height: 140.h,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 140.w,
                                  child: Image.network(
                                    cubit.cartProductModel[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: cubit
                                            .cartProductModel[index].name,
                                        fontSize: 24.sp,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      CustomText(
                                        color: primaryColor,
                                        text:
                                            '\$${cubit.cartProductModel[index].price}',
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 40.h,
                                        color: Colors.grey.shade200,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              child: const Icon(Icons.add),
                                              onTap: () {
                                                cubit.increaseQuantity(index);
                                              },
                                            ),
                                            SizedBox(
                                              width: 20.h,
                                            ),
                                            CustomText(
                                              alignment: Alignment.center,
                                              fontSize: 20.sp,
                                              color: Colors.black,
                                              text: cubit
                                                  .cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                            ),
                                            SizedBox(
                                              width: 20.h,
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 20.h),
                                                child: GestureDetector(
                                                  child: const Icon(Icons.minimize),
                                                  onTap: () {
                                                    cubit.decreaseQuantity(
                                                        index);
                                                  },
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      },
                      itemCount: cubit.cartProductModel.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: 'TOTAl',
                              fontSize: 20.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: '\$${cubit.totalPrice}',
                              fontSize: 18.sp,
                              color: primaryColor,
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20.h),
                          height: 100.h,
                          width: 180.w,
                          child: CustomButton(
                            onPress: () {},
                            text: 'CHECKOUT',
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
      },
    );
  }
}
