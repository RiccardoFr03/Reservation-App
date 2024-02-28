import 'package:cloud_craft_solution/domain/models/desk_bools_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class DeskWidget extends StatelessWidget {
  final DeskBoolsModel desk;
  final VoidCallback onPressed;
  final bool selected;

  const DeskWidget(
      {super.key,
      required this.desk,
      required this.onPressed,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            Icons.chair,
            size: 48,
            color: desk.isAvaiable
                ? selected
                    ? primariBlue
                    : primaryGreen
                : primaryRed,
          ),
          Text(
            desk.deskName,
            style: semibold_16,
          )
        ],
      ),
    );
  }
}
