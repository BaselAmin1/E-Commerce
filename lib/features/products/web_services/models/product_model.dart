import 'package:e_commerce/core/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  late String productId, name, image, description, sized, price;
  Color? color;

  ProductModel(
      this.productId,
      this.name,
      this.image,
      this.description,
      this.color,
      this.sized,
      this.price);

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
  }

  toJson() {
    return {
      ' productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
    };
  }
}
