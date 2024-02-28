import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReservationType extends StatelessWidget {
  final String title;
  final FaIcon icona;
  final VoidCallback? function;
  final bool selected;

  const ReservationType(
      {super.key,
      required this.icona,
      this.function,
      required this.title,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 120,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            border: selected ? null : Border.all(color: Colors.black),
            color: selected ? primariBlue : Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icona,
            height_8,
            Text(
              title,
              style: semibold_16.copyWith(
                  color: selected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
