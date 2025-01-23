import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/profile/view/screen/profile_screen.dart';

import '../../../product/view/screen/product_screen.dart';
import '../widget/card_widget.dart';
import '../widget/laptop_widget.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Categories",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SizedBox(height: 50),
          CardWidget(endpoint: "electronics", icon: '💻', text: 'Electronics'),
          SizedBox(height: 50),
          CardWidget(endpoint: 'jewelery', icon: '💍', text: 'Jewelery'),
          SizedBox(height: 50),
          CardWidget(
              endpoint: "men's%20clothing", icon: '👔', text: "Men'sClothing"),
          SizedBox(height: 50),
          CardWidget(
              endpoint: "women's%20clothing",
              icon: '👜',
              text: "Women'sClothing"),
          SizedBox(height: 50),
          LaptopWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        },
        child: const Icon(Icons.perm_identity_outlined),
      ),
    );
  }
}
