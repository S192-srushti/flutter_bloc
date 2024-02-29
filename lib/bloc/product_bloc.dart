import 'package:bloc/bloc.dart';
import 'package:bloc_demo/models/product.dart';
import 'package:http/http.dart' as http;
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoadingState()) {
    on<ProductLoadedEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());
        var response =
            await http.get(Uri.parse("https://fakestoreapi.com/products"));
        emit(ProductLoadedState(productModelFromJson(response.body)));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
