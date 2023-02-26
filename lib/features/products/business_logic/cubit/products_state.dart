// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class GetCategorySuccess extends ProductsState {


}

class GetCategoryError extends ProductsState {
  String error;
  GetCategoryError({
    required this.error,
  });
}


class GetBestSellingSuccess extends ProductsState {


}

class GetBestSellingError extends ProductsState {
  String error;
  GetBestSellingError({
    required this.error,
  });
}