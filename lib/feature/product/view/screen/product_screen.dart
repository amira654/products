import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/product/cubit/cubit/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: const Text("Products"),
      ),
      drawer: const Drawer(
      //  child: ProfileScreen(),
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
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Text("something went wrong");
            }
          },
        ),
      ),
    );
  }
}
