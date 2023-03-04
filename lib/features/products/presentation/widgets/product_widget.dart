import 'package:e_commerce/core/route/route_path.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  final index;
  final name;
  final description;
  final image;
  final price;
  final categoryIndex;
  final previosPage;

  const ProductWidget({
    super.key,
    required this.index,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
 required   this.categoryIndex,
  required  this.previosPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, productDetailsScreen, arguments: {index,categoryIndex,previosPage});
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .4,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: Colors.grey.shade100,
              ),
              child: SizedBox(
                  height: 220.h,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              text: name,
              alignment: Alignment.bottomLeft,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: CustomText(
                text: description,
                color: Colors.grey,
                alignment: Alignment.bottomLeft,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              text: price + " \$",
              color: primaryColor,
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}
