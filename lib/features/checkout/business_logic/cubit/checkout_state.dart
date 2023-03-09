part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}
class ChangeDeliveryState extends CheckoutState{}
class ChangeCheckoutState extends CheckoutState{}
