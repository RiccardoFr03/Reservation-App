import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final bool isGradinet;
  final Color? color;
  final Color textColor;
  const MyElevatedButton(
      {super.key,
      required this.name,
      required this.onTap,
      required this.isGradinet,
      this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: isGradinet ? double.infinity : 320,
        decoration: BoxDecoration(
          color: color,
          gradient: isGradinet ? primayGradient : null,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
