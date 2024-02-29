part of 'product_bloc.dart';

abstract class ProductState {
  const ProductState();
}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> productList;
  const ProductLoadedState(this.productList);
}

class ProductErrorState extends ProductState {
  final String errorMsg;
  const ProductErrorState(this.errorMsg);
}
