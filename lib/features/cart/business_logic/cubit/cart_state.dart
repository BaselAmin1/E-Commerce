// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class InsertSuccess extends CartState {}

class InsertError extends CartState {
  String error;
  InsertError({
    required this.error,
  });
}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {
  String error;
  GetCartError({
    required this.error,
  });
}

class QuantityIncrease extends CartState {}
class QuantityDecrease extends CartState {}