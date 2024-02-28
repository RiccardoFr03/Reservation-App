import 'package:cloud_craft_solution/domain/models/user_reservation_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/bottom_sheet_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationWidget extends StatefulWidget {
  final UserReservationModel reservation;
  final VoidCallback update;

  const ReservationWidget(
      {super.key, required this.reservation, required this.update});

  @override
  State<ReservationWidget> createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BottomSheetInfo(
              update: widget.update,
              reservation: widget.reservation,
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:
              widget.reservation.dateTimeStart.isBefore(DateTime.now()) &&
                      widget.reservation.dateTimeEnd.isAfter(DateTime.now())
                  ? currentReservation
                  : cardShadow,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.reservation.isDesk
                  ? 'Desk'
                  : widget.reservation.reservationName,
              style: bold_24,
            ),
            const SizedBox(height: 4),
            Text(
              '${widget.reservation.buildingName} - ${widget.reservation.roomName}',
              style: semibold_18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('HH:mm').format(widget.reservation.dateTimeStart),
                  style: bold_36.copyWith(fontSize: 28),
                ),
                width_4,
                const Icon(
                  Icons.arrow_forward,
                  size: 46,
                ),
                width_4,
                Text(
                  DateFormat('HH:mm').format(widget.reservation.dateTimeEnd),
                  style: bold_36.copyWith(fontSize: 28),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
