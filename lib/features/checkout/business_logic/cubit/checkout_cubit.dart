import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  static CheckoutCubit get(context) => BlocProvider.of(context);

  int checkoutIndex = 0;
  void changeCheckout(index) {
    checkoutIndex = index;
    emit(ChangeCheckoutState());
  }
  int deliveryChoice = 1;
  void changeDelivery(index) {
    deliveryChoice = index;
    emit(ChangeDeliveryState());
  }
}
