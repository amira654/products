import 'package:flutter/material.dart';

import '../../../cart/cubit/cubit/cart_cubit.dart';
import '../../../fav/cubit/cubit/fav_cubit.dart';
import '../../model/product_model.dart';

class ProductSuccessWidget extends StatelessWidget {
  const ProductSuccessWidget({super.key, required this.productsModel});
  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                productsModel.productImage,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              productsModel.productName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            productsModel.producrDescription == null
                ? const Text('')
                : Text(
                    productsModel.producrDescription!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                
                  children: [
                    const Text(
                      "price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      productsModel.productPrice.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // const Spacer(
            //   flex: 1,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    CartCubit.get(context).getAddToCartCubit();
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    FavCubit.get(context).addFavCubit(productId: productsModel.productId);
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
