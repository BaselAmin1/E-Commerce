import 'package:e_commerce/core/route/route_path.dart';
import 'package:e_commerce/core/utils/strings.dart';

import 'package:e_commerce/features/auth/presentation/widgets/custom_text.dart';
import 'package:e_commerce/features/products/business_logic/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProductsCubit.get(context);
        kProducts = cubit.productModel;
        return Scaffold(
          body: kProducts.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomText(
                        text: "Categories",
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      _listViewCategory(context),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18.sp,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 16.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      _listViewProducts(context),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory(context) {
    var cubit = ProductsCubit.get(context);
    return Container(
      height: 100.h,
      child: ListView.separated(
        itemCount: cubit.categoryModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.grey.shade100,
                ),
                height: 60.h,
                width: 60.w,
                child: Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: Image.network(cubit.categoryModel[index].image!),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: cubit.categoryModel[index].name!,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20.h,
        ),
      ),
    );
  }

  Widget _listViewProducts(context) {
    var cubit = ProductsCubit.get(context);
    return Container(
      height: 400.h,
      width: 500.w,
      child: ListView.separated(
        itemCount: kProducts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, productDetailsScreen,
                  arguments: index);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: Colors.grey.shade100,
                    ),
                    child: Container(
                        height: 220.h,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.network(
                          kProducts[index].image!,
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text: kProducts[index].name!,
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: CustomText(
                      text: kProducts[index].description!,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text:kProducts[index].price.toString() + " \$",
                    color: primaryColor,
                    alignment: Alignment.bottomLeft,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20.w,
        ),
      ),
    );
  }
}
