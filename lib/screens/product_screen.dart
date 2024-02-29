import 'package:bloc_demo/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(ProductLoadedEvent());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoadedState) {
              return ListView.builder(
                  itemCount: state.productList.length,
                  itemBuilder: (context, i) => ListTile(
                        title: Text("${state.productList[i].title}"),
                      ));
            } else {
              return Container();
            }
            // switch ( ProductState state) {
            //   case ProductLoadingState:
            //     return const CircularProgressIndicator();
            //   case ProductLoadedState:
            //     return ListView.builder(
            //         itemCount: 5,
            //         itemBuilder: (context, count) => const ListTile());

            //   default:
            //     return Container();
            // }
          },
        ),
      ),
    );
  }
}
