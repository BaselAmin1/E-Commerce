import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text.dart';
import 'package:e_commerce/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  final index;
  bool list = true;
  final categoryIndex;
  final previosPage;
  ProductDetailsScreen(
      {super.key,
      required this.index,
      required this.categoryIndex,
      required this.previosPage});

  Widget buildSliverAppBar(name, image, details) {
    if (previosPage == 'categoryScreen') {
      list = false;
    } else {
      list = true;
    }
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        background: Hero(
          tag: details,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var cartCubit = CartCubit.get(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: kProducts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                list
                    ? buildSliverAppBar(
                        kProducts[index].name,
                        kProducts[index].image,
                        kProducts[index].description,
                      )
                    : buildSliverAppBar(
                        kCategories[this.categoryIndex].products[index].name,
                        kCategories[this.categoryIndex].products[index].image,
                        kCategories[this.categoryIndex].products[index].description,
                      ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 0.h),
                        padding: EdgeInsets.all(8.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  text: list
                                      ? kProducts[index].name!
                                      : kCategories[this.categoryIndex]
                                          .products[index]
                                          .name!,
                                  fontSize: 26.sp,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16.h),
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          border: Border.all(
                                            color: Colors.grey,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(
                                            text: 'Size',
                                          ),
                                          CustomText(
                                            text: list
                                                ? kProducts[index].size!
                                                : kCategories[
                                                        this.categoryIndex]
                                                    .products[index]
                                                    .size!,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16.h),
                                      width: MediaQuery.of(context).size.width *
                                          .44,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          border: Border.all(
                                            color: Colors.grey,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(
                                            text: 'Color',
                                          ),
                                          Container(
                                            width: 30.w,
                                            height: 20.h,
                                            padding: EdgeInsets.all(12.h),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: list
                                                  ? kProducts[index].color!
                                                  : kCategories[
                                                          this.categoryIndex]
                                                      .products[index]
                                                      .color!,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomText(
                                  text: 'Details',
                                  fontSize: 18.sp,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomText(
                                  text: list
                                      ? kProducts[index].description!
                                      : kCategories[this.categoryIndex]
                                          .products[index]
                                          .description!,
                                  fontSize: 18.sp,
                                  height: 2.5.h,
                                  maxLine: 200,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(30.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          CustomText(
                                            text: "PRICE ",
                                            fontSize: 22.sp,
                                            color: Colors.grey,
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                text: ' \$',
                                                color: primaryColor,
                                                fontSize: 18.sp,
                                              ),
                                              CustomText(
                                                text: list
                                                    ? kProducts[index].price!
                                                    : kCategories[
                                                            this.categoryIndex]
                                                        .products[index]
                                                        .price!,
                                                color: primaryColor,
                                                fontSize: 18.sp,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      BlocProvider(
                                        create: (context) => CartCubit(),
                                        child: Container(
                                          padding: EdgeInsets.all(20.h),
                                          width: 180.w,
                                          height: 100.h,
                                          child: CustomButton(
                                            onPress: () {
                                              // cartCubit.getAllProduct();
                                              cartCubit.addProduct(
                                                CartModel(
                                                  kProducts[index].productId!,
                                                  kProducts[index].name!,
                                                  kProducts[index].image!,
                                                  1,
                                                  kProducts[index].price!,
                                                ),
                                              );
                                            },
                                            text: 'Add',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
