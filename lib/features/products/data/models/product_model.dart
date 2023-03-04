import 'package:e_commerce/core/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  late String productId, name, image, description, size, price;
  Color? color;

  ProductModel(
      this.productId,
      this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price
      );

  ProductModel.fromJson(Map<String, dynamic> json) {

    productId = json['productId'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    color = HexColor.fromHex(json['color']);
    size = json['size'];
    price = json['price'];
     
  }

  toJson() {
    return {
    'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
    };
    
  }

}

