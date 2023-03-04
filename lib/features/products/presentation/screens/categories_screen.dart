import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/products/business_logic/cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  final index;
  const CategoriesScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var cubit = ProductsCubit.get(context);
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                kCategories[this.index].categoryName,
                // textAlign: TextAlign.justify,
              ),
            ),
            actions: [
              SizedBox(
                width: 50.w,
              )
            ],
            backgroundColor: primaryColor,
          ),
          body: Container(
            //  height: 500.h,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 1,
                    ),
                    shrinkWrap: true,
                    itemCount: (kCategories[index].products).length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ProductWidget(
                          categoryIndex: this.index,
            previosPage: 'categoryScreen',
                          index: index,
                          description: kCategories[this.index]
                              .products[index]
                              .description,
                          image: kCategories[this.index].products[index].image!,
                          name: kCategories[this.index].products[index].name!,
                          price: kCategories[this.index].products[index].price,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
