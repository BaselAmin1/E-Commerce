import 'package:e_commerce/core/helper/extenstion.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String? categoryImage;
  String? categoryName;
  List<Products>? products;

  CategoryModel({this.categoryImage, this.categoryName, this.products});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryImage = json['categoryImage'];
    categoryName = json['categoryName'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryImage'] = this.categoryImage;
    data['categoryName'] = this.categoryName;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? name;
  String? image;
  String? price;
   Color? color;
 
  String? size;
  String? productId;
  String? description;

  Products(
      {this.name,
      this.image,
      this.price,
      this.color,
      this.size,
      this.productId,
      this.description});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    color =HexColor.fromHex( json['color']);
    size = json['size'];
    productId = json['productId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['color'] = this.color;
    data['size'] = this.size;
    data['productId'] = this.productId;
    data['description'] = this.description;
    return data;
  }
}