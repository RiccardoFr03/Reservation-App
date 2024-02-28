import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoomReservation extends StatefulWidget {
  final DateTime data;
  final Function(DateTime) functionDateStart;
  final Function(DateTime) functionDateEnd;
  const RoomReservation(
      {super.key,
      required this.data,
      required this.functionDateStart,
      required this.functionDateEnd});

  @override
  State<RoomReservation> createState() => _RoomReservationState();
}

class _RoomReservationState extends State<RoomReservation> {
  DateTime? dateStart;
  DateTime? dateEnd;

  @override
  void initState() {
    dateStart = MyDateFormatter.dateNow(widget.data);
    dateEnd =
        MyDateFormatter.dateNow(widget.data)!.add(const Duration(minutes: 30));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          child: Column(
            children: [
              Text(
                'Inizio',
                style: semibold_16.copyWith(fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (dateEnd!.add(const Duration(minutes: 29)).day ==
                        dateStart!.day) {
                      dateStart = dateStart!.add(const Duration(minutes: 30));
                      widget.functionDateStart(dateStart!);
                      dateEnd = dateEnd!.add(const Duration(minutes: 30));
                      widget.functionDateEnd(dateEnd!);
                    }
                  });
                },
                child: const Icon(
                  Icons.expand_less,
                  size: 56,
                ),
              ),
              Text(
                DateFormat('HH:mm').format(dateStart!),
                style: bold_24,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (dateStart!.subtract(const Duration(minutes: 30)).day ==
                        dateEnd!.day) {
                      dateStart =
                          dateStart!.subtract(const Duration(minutes: 30));
                      widget.functionDateStart(dateStart!);
                      dateEnd = dateEnd!.subtract(const Duration(minutes: 30));
                      widget.functionDateEnd(dateEnd!);
                    }
                  });
                },
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 56,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'Fine',
              style: semibold_16.copyWith(fontSize: 20),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (dateEnd!.day == dateStart!.day) {
                    dateEnd = dateEnd!.add(const Duration(minutes: 30));
                    widget.functionDateEnd(dateEnd!);
                  }
                });
              },
              child: const Icon(
                Icons.expand_less,
                size: 56,
              ),
            ),
            Text(
              DateFormat('HH:mm').format(dateEnd!),
              style: bold_24,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (dateStart!.isBefore(
                      dateEnd!.subtract(const Duration(minutes: 31)))) {
                    dateEnd = dateEnd!.subtract(const Duration(minutes: 30));
                    widget.functionDateEnd(dateEnd!);
                  }
                });
              },
              child: const Icon(
                Icons.keyboard_arrow_down,
                size: 56,
              ),
            ),
          ],
        )
      ],
    );
  }
}
