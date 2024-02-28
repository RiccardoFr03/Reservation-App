import 'package:cloud_craft_solution/domain/models/holiday_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventBottomSheet extends StatefulWidget {
  final HolidayModel holiday;
  const EventBottomSheet({super.key, required this.holiday});

  @override
  State<EventBottomSheet> createState() => _EventBottomSheetState();
}

class _EventBottomSheetState extends State<EventBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.holiday.name,
              style: bold_24,
            ),
            height_16,
            Text(
              widget.holiday.description,
              style: semibold_18,
              textAlign: TextAlign.center,
            ),
            height_8,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.event,
                  size: 32,
                ),
                width_8,
                Text(
                  DateFormat('dd/MM/yyyy').format(widget.holiday.dateTimeStart),
                  style: bold_20,
                ),
                width_8,
                const Icon(
                  Icons.arrow_forward,
                  size: 32,
                ),
                width_8,
                Text(
                  DateFormat('dd/MM/yyyy').format(widget.holiday.dateTimeEnd),
                  style: bold_20,
                ),
                width_16
              ],
            ),
          ],
        ),
      ),
    );
  }
}
