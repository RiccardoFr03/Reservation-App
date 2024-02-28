import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:cloud_craft_solution/ui/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseRoomHeader extends StatelessWidget {
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String buildigName;
  const ChooseRoomHeader(
      {super.key, required this.dateStart, required this.dateEnd, required this.buildigName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_month,
              size: 24,
            ),
            width_4,
            Text(
              MyDateFormatter.titleDate(dateStart!),
              style: semibold_18,
            ),
            width_16,
            const Icon(
              Icons.location_on,
              size: 24,
            ),
            width_4,
            Text(
              buildigName,
              style: semibold_18,
            )
          ],
        ),
        height_8,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('HH:mm').format(dateStart!),
              style: semibold_18,
            ),
            width_4,
            const Icon(Icons.arrow_forward),
            width_4,
            Text(
              DateFormat('HH:mm').format(dateEnd!),
              style: semibold_18,
            ),
          ],
        ),
        height_8,
      ],
    );
  }
}
