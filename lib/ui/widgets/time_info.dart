import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeInfo extends StatefulWidget {
  final DateTime start;
  final DateTime end;
  final Icon icona;
  const TimeInfo(
      {super.key, required this.start, required this.end, required this.icona});

  @override
  State<TimeInfo> createState() => _TimeInfoState();
}

class _TimeInfoState extends State<TimeInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icona,
        Text(
          ': ${DateFormat('HH:mm').format(widget.start)}',
          style: bold_20,
        ),
        const SizedBox(width: 4),
        const Icon(
          Icons.arrow_forward,
          size: 32,
        ),
        const SizedBox(width: 4),
        Text(
           ': ${DateFormat('HH:mm').format(widget.end)}',
          style: bold_20,
        ),
      ],
    );
  }
}
