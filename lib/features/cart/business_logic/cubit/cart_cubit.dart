import 'package:e_commerce/features/cart/data/local_database/cart_database.dart';
import 'package:e_commerce/features/cart/data/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List<CartModel> _cartProductModel = [];
  List<CartModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  var dbHelper = CartDatabase.db;
  double _totalPrice = 0;
  getAllProduct() async {
    try {
      _cartProductModel = await dbHelper.getAllProduct();
      print(_cartProductModel.length);
      getTotalPrice();
      emit(GetCartSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetCartError(error: e.toString()));
    }
  }

  addProduct(CartModel cartModel) async {
    _cartProductModel = await dbHelper.getAllProduct();
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartModel.productId) {
        increaseQuantity(i);
        return;
      }
    }
    try {
      await dbHelper.insertProduct(cartModel);
      print('totaaaa');
      emit(InsertSuccess());
    } catch (e) {
      print(e.toString());
      emit(InsertError(error: e.toString()));
    }
    //}
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      print(_totalPrice);
    }
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;

    _totalPrice += (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    emit(QuantityIncrease());
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;

    _totalPrice -= (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    emit(QuantityDecrease());
  }
}
