import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/home/view/screen/start_screen.dart';
import 'package:flutter_application_2/feature/product/cubit/cubit/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../cart/view/screen/cart_screen.dart';
import '../../../fav/view/fav_screen.dart';
import '../../../profile/view/screen/profile_screen.dart';
import '../../cubit/cubit/product_state.dart';
import '../widget/product_succes_widget.dart';
import 'product_description.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text("Products", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          elevation: 5,
          backgroundColor: Colors.teal),
      endDrawer: const Drawer(
        child: StartScreen(),
      ),
      body: BlocProvider(
        create: (context) => ProductCubit()..getProductDataCubit(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductSuccessState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                child: GridView.count(
                  //physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.8,
                  children: List.generate(
                    state.productData.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductDescription(
                                productsModel: state.productData[index]);
                          }));
                        },
                        child: ProductSuccessWidget(
                          productsModel: state.productData[index],
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is ProductLoadingState) {
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
            } else {
              return const Text("something went wrong");
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
              child: const Icon(Icons.favorite_border),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavScreen(),
                  ),
                );
              })
        ],
      ),
    );
  }
}
