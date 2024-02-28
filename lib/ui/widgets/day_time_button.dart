import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class DayTimeButton extends StatefulWidget {
  final bool selected;
  final String name;
  final VoidCallback? function;
  const DayTimeButton(
      {super.key, required this.name, this.function, required this.selected});

  @override
  State<DayTimeButton> createState() => _DayTimeButtonState();
}

class _DayTimeButtonState extends State<DayTimeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        height: 74,
        width: 122,
        decoration: BoxDecoration(
            color: widget.selected ? primariBlue : Colors.white,
            borderRadius: BorderRadius.circular(48),
            border: widget.selected ? null : Border.all(color: Colors.black)),
        child: Center(
          child: Text(
            widget.name,
            style: semibold_16.copyWith(
                color: widget.selected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
