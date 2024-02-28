import 'package:cloud_craft_solution/domain/models/user_reservation_by_day_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/date_formatter.dart';
import 'package:cloud_craft_solution/ui/widgets/reservation_card.dart';
import 'package:flutter/material.dart';

class ReservationList extends StatelessWidget {
  final UserReservationByDay userReservationByDay;
  final VoidCallback update;
  const ReservationList({super.key, required this.userReservationByDay, required this.update});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MyDateFormatter.titleDate(userReservationByDay.date),
          style: bold_20,
        ),
        for (var i = 0; i < userReservationByDay.reservations.length; i++)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ReservationCard(
              update: update,
              reservation: userReservationByDay.reservations[i],
            ),
          )
      ],
    );
  }
}
