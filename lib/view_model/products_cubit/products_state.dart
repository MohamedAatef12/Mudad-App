part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsSuccess extends ProductsState {
  List<String> products = [];
  List<String> images = [];
  List<int> prices = [];
  List<int> quantity = [];
  List<Map<String,dynamic>> orders=[];

  ProductsSuccess(this.products, this.images, this.prices, this.quantity,this.orders);
}

class ProductsLoading extends ProductsState {}

class ProductsFailure extends ProductsState {}

class ProductsAdded extends ProductsState {}

class ProductsRemoved extends ProductsState {}
