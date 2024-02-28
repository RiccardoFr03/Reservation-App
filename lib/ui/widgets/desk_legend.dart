import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:flutter/material.dart';

class DeskLegend extends StatelessWidget {
  const DeskLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.chair,
          size: 26,
          color: primaryRed,
        ),
        width_4,
        Text(
          'Occupata',
          style: semibold_16,
        ),
        width_16,
        Icon(
          Icons.chair,
          size: 26,
          color: primaryGreen,
        ),
        width_4,
        Text(
          'Libera',
          style: semibold_16,
        ),
        width_16,
        Icon(
          Icons.chair,
          size: 26,
          color: primariBlue,
        ),
        width_4,
        Text(
          'Selezionata',
          style: semibold_16,
        )
      ],
    );
  }
}
