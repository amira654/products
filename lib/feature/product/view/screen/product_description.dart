import 'package:flutter/material.dart';

import '../../../cart/cubit/cubit/cart_cubit.dart';
import '../../model/product_model.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.productsModel});
  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Details')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  productsModel.productImage,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    productsModel.productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: [
                      const Text(
                        "price",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        productsModel.productPrice.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color:Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: productsModel.producrDescription == null
                  ? const Text('')
                  : Text(
                      productsModel.producrDescription!,
                      style: const TextStyle(fontSize: 18),
                    ),
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                onPressed: () {
                  CartCubit.get(context).getAddToCartCubit();
                },
                padding: const EdgeInsets.all(16),
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: const Row(
                 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add To Cart",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}