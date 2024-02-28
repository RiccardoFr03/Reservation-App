import 'package:cloud_craft_solution/ui/utils/date_formatter.dart';
import 'package:cloud_craft_solution/ui/widgets/day_time_button.dart';
import 'package:flutter/material.dart';

class DeskReservation extends StatefulWidget {
  final DateTime data;
  final Function(DateTime) dateStart;
  final Function(DateTime) dateEnd;

  const DeskReservation(
      {super.key,
      required this.dateStart,
      required this.dateEnd,
      required this.data});

  @override
  State<DeskReservation> createState() => _DeskReservationState();
}

class _DeskReservationState extends State<DeskReservation> {
  int partOfDay = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DayTimeButton(
              selected: partOfDay == 0 ? true : false,
              function: () {
                setState(() {
                  partOfDay = 0;
                  widget.dateStart(MyDateFormatter.allDayStart(widget.data));
                  widget.dateEnd(MyDateFormatter.allDayEnd(widget.data));
                });
              },
              name: 'Giornata',
            ),
            DayTimeButton(
              selected: partOfDay == 1 ? true : false,
              function: () {
                setState(() {
                  partOfDay = 1;
                  widget.dateStart(MyDateFormatter.morningStart(widget.data));
                  widget.dateEnd(MyDateFormatter.morningEnd(widget.data));
                });
              },
              name: 'Mattino',
            ),
            DayTimeButton(
              selected: partOfDay == 2 ? true : false,
              function: () {
                setState(() {
                  partOfDay = 2;
                  widget.dateStart(MyDateFormatter.afternoonStart(widget.data));
                  widget.dateEnd(MyDateFormatter.afteroonEnd(widget.data));
                });
              },
              name: 'Pomeriggio',
            ),
          ],
        )
      ],
    );
  }
}
