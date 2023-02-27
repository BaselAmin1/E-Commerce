class CartModel {
  late String productId, name, image, price;
  late int quantity;

  CartModel(this.productId, this.name, this.image, this.quantity, this.price);

  CartModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    image = map['image'];

    quantity = map['quantity'];
    price = map['price'];
  }

  toJson() {
    return {
      ' productId': productId,
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
