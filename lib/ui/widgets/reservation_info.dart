import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ReservationInfo extends StatefulWidget {
  final Icon icona;
  final String title;
  const ReservationInfo({super.key, required this.icona, required this.title});

  @override
  State<ReservationInfo> createState() => _ReservationInfoState();
}

class _ReservationInfoState extends State<ReservationInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icona,
        Text(
          ': ${widget.title}',
          style: bold_20,
        )
      ],
    );
  }
}
