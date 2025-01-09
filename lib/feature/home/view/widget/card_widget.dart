import 'package:flutter/material.dart';

import '../screen/category_screen.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.endpoint,
      required this.icon,
      required this.text});
  final String endpoint;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              endpoint: endpoint,
              title: text,
            ),
          ),
        );
      },
      child: Card(
          elevation: 2,
          child: ListTile(
            leading: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            trailing: Text(
              icon,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          )),
    ));
  }
}
