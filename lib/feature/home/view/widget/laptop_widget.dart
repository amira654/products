import 'package:flutter/material.dart';

import '../../../product/view/screen/product_screen.dart';
import '../screen/category_screen.dart';

class LaptopWidget extends StatelessWidget {
  const LaptopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductsScreen(),
          ),
        );
      },
      child: const Card(
          elevation: 2,
          child: ListTile(
            leading: Text(
              "Laptops",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            trailing: Text(
              "💻",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          )),
    ));
  }
}
