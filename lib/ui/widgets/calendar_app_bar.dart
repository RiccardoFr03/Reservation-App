import 'package:cloud_craft_solution/domain/helpers/date_helpers.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class CalendarAppBar extends StatefulWidget {
  final DateTime dateArgs;
  final EasyInfiniteDateTimelineController myController;
  final Function(DateTime) updateData;
  final VoidCallback goToSelectedDate;

  const CalendarAppBar(
      {super.key,
      required this.dateArgs,
      required this.updateData,
      required this.myController,
      required this.goToSelectedDate});

  @override
  State<CalendarAppBar> createState() => _CalendarAppBarState();
}

class _CalendarAppBarState extends State<CalendarAppBar> {
  List<DateTime> disabledDates = DateHelpers.generateDisabledDates();
  DateTime now = DateTime.now();
  DateTime selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      showTimelineHeader: false,
      focusDate: widget.dateArgs,
      controller: widget.myController,
      lastDate: DateTime.now().add(const Duration(days: 600)),
      locale: 'it',
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      disabledDates: disabledDates,
      onDateChange: (selectedDate) {
        setState(() {
          selected = selectedDate;
        });
        widget.goToSelectedDate;

        widget.updateData(selected);
      },
      activeColor: const Color(0xff116A7B),
      dayProps: EasyDayProps(
        landScapeMode: true,
        borderColor: Colors.black,
        todayStyle: DayStyle(
          dayNumStyle: semibold_16,
          monthStrStyle: semibold_16,
          dayStrStyle: semibold_16,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(
              Radius.circular(48),
            ),
          ),
        ),
        inactiveDayStyle: DayStyle(
          dayNumStyle: semibold_16,
          monthStrStyle: semibold_16,
          dayStrStyle: semibold_16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(48),
            ),
            border: Border.all(color: Colors.black),
          ),
        ),
        disabledDayStyle: DayStyle(
          dayNumStyle: semibold_16,
          monthStrStyle: semibold_16,
          dayStrStyle: semibold_16,
          decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: const BorderRadius.all(
                Radius.circular(48),
              )),
        ),
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            color: primariBlue,
            borderRadius: const BorderRadius.all(
              Radius.circular(48),
            ),
          ),
        ),
        dayStructure: DayStructure.dayStrDayNum,
      ),
    );
  }
}
