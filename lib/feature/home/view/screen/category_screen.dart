import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/profile/view/screen/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../cubit/cubit/product_cubit.dart';
import '../../cubit/cubit/product_state.dart';
import '../../model/post_data.dart';
import '../widget/custom_appBar.dart';
import '../widget/product_item.dart';
import 'start_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.endpoint, required this.title});
  final String endpoint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ProductData())..fetchProducts(endpoint),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductError) {
            showSnackBar(context, 'Error: ${state.message}', Colors.red);
          } else if (state is ProductSuccess) {
            showSnackBar(context, 'Data loaded successfully!', Colors.teal);
          }
        },
        builder: (context, state) {
          if (state is ProductSuccess) {
            return Scaffold(
              appBar: customAppBar(
                title: title,
              ),
              drawer: const Drawer(
                child: ProfileScreen(),
              ),
              body: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: state.model.length,
                itemBuilder: (context, index) {
                  final product = state.model[index];
                  return ProductItem(
                    product: product,
                  );
                },
              ),
            );
          } else if (state is ProductError) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
                backgroundColor: Colors.red,
              ),
              body: Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          } else {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 178, 201, 221), Colors.teal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const SpinKitCircle(
                color: Color.fromARGB(255, 179, 178, 178),
                size: 100.0,
              ),
            );
          }
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
    ),
  );
}
