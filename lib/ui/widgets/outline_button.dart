import 'package:flutter/material.dart';

class MyOutlineButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const MyOutlineButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
