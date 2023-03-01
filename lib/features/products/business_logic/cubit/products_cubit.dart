import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/service/firesotre_products.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/products/data/models/category_model.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);
  List<CategoryModel> categoryModel = [];

  //List<CategoryModel> get categoryModel => _categoryModel;

  // List<ProductModel> get productModel => _productModel;
  List<ProductModel> productModel = [];

  // HomeViewModel() {
  //   getCategory();
  //   //getBestSellingProducts();
  // }

  getCategory() async {
    try {
      await FireStoreProducts().getCategory().then((value) {
        for (int i = 0; i < value.length; i++) {
          categoryModel.add(
              CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
        }
      });

      emit(GetCategorySuccess());
    } catch (e) {
      print(e.toString());
      emit(GetCategoryError(error: e.toString()));
    }
  }

  getBestSellingProducts() async {
    try {
      FireStoreProducts().getBestSelling().then(
        (value) {
          for (int i = 0; i < value.length; i++) {
            productModel.add(
                ProductModel.fromJson(value[i].data() as Map<String, dynamic>));
          }
        },
      );
  
      emit(GetBestSellingSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetBestSellingError(error: e.toString()));
    }
  }
}
