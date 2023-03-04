import 'package:e_commerce/core/route/route_path.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text.dart';
import 'package:e_commerce/features/products/business_logic/cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProductsCubit.get(context);
        kProducts = cubit.productModel;

        kCategories = cubit.categoryModel;

        return Scaffold(
          body: kProducts.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      SizedBox(
                        height: 30.h,
                      ),
                      const CustomText(
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
        decoration: const InputDecoration(
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
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        itemCount: cubit.categoryModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              kCategoryIndex = index;
              Navigator.pushNamed(context, categoriesScreen,);
            },
            child: Column(
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
                    child: Image.network(
                        cubit.categoryModel[index].categoryImage!),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  text: cubit.categoryModel[index].categoryName!,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20.h,
        ),
      ),
    );
  }

  Widget _listViewProducts(context) {
    return SizedBox(
      height: 400.h,
      width: 500.w,
      child: ListView.separated(
        itemCount: kProducts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductWidget(
            onTapRoute: productDetailsScreenBestSelling,
            description: kProducts[index].description!,
            image: kProducts[index].image!,
            index: index,
            name: kProducts[index].name!,
            price: kProducts[index].price!,
           
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20.w,
        ),
      ),
    );
  }
}
