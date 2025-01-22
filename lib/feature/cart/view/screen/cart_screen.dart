import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit/cart_cubit.dart';
import '../../cubit/cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getAllCartCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
          if (state is CartGetAllSuccess) {
            return ListView.builder(
              itemCount: state.listCart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(state.listCart[index].image),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        CartCubit.get(context).deleteCartCubit(
                            productId: state.listCart[index].id);
                      },
                      icon: const Icon(Icons.delete)),

                  title: Text(state.listCart[index].name),
                 
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
