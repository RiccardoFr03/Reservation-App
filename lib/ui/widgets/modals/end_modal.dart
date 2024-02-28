// ignore_for_file: use_build_context_synchronously

import 'package:cloud_craft_solution/data/repositories/reservation_repository.dart';
import 'package:cloud_craft_solution/domain/models/user_reservation_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

class EndModal extends StatefulWidget {
  final UserReservationModel reservation;
  final VoidCallback update;
  const EndModal({super.key, required this.reservation, required this.update});

  @override
  State<EndModal> createState() => _EndModalState();
}

class _EndModalState extends State<EndModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Vuoi Terminare:',
              style: bold_20,
              textAlign: TextAlign.center,
            ),
            height_8,
            Text(
              widget.reservation.isDesk
                  ? widget.reservation.roomName
                  : widget.reservation.reservationName,
              style: bold_20,
              textAlign: TextAlign.center,
            ),
            height_16,
            MyElevatedButton(
              name: 'Conferma',
              onTap: () async {
                end();
              },
              isGradinet: false,
              textColor: Colors.white,
              color: primariBlue,
            )
          ],
        ),
      ),
    );
  }

  void end() async {
    await ReservationRepository.endReservation(widget.reservation.reservationId)
        .then((value) {
      widget.update();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Tutto Okay!',
            style: semibold_16,
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
          backgroundColor: primaryGreen,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      );
    }).onError((error, stackTrace) {
      widget.update();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Qualcosa è andato storto!',
            style: semibold_16,
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
          backgroundColor: primaryRed,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      );
    });
  }
}
