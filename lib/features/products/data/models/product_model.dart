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

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }
    productId = json['productId'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    color = HexColor.fromHex(json['color']);
    sized = json['sized'];
    price = json['price'];
     
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

