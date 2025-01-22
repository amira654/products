import 'package:flutter/material.dart';

import '../../../product/view/screen/product_screen.dart';
import '../widget/card_widget.dart';

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
          CardWidget(endpoint: 'jewelery'   , icon: '💍' , text: 'Jewelery'),
          SizedBox(height: 50),
          CardWidget(endpoint: "men's%20clothing", icon: '👔', text: "Men'sClothing"),
          SizedBox(height: 50),
          CardWidget(endpoint: "women's%20clothing", icon: '👜',text: "Women'sClothing"),
             ],
      ),
    );
  }
}
