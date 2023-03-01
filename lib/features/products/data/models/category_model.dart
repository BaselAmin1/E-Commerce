import 'package:e_commerce/features/products/data/models/product_model.dart';

class CategoryModel {
  String? name, image;
 List<Map<dynamic, dynamic>>? products;

  CategoryModel(this.name, this.image, this.products);

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    products = ProductModel.fromJson(
      json['products']) as List<Map>?  ;
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'products':products,
    };
  }
}
