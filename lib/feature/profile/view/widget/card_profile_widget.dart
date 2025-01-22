import 'package:flutter/material.dart';

class CardProfileWidget extends StatelessWidget {
  const CardProfileWidget({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Card(
            elevation: 2,
            child: ListTile(
              trailing: Text(
                text,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: Icon(
                icon,
                size: 40,
              ),
            )));
  }
}

/*  Card Build_body(SucessProfileCubit state,
      {required String text, required IconData? icon}) {
    return Card(
      elevation: 2,
      child: ListTile(
        trailing: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        leading: Icon(
          icon,
          size: 40,
        ),
      ),
    );
  }
} */
