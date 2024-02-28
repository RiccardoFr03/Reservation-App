import 'package:cloud_craft_solution/domain/models/user_reservation_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/widgets/modals/end_modal.dart';
import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  final UserReservationModel reservation;
  final VoidCallback update;
  const CheckButton(
      {super.key, required this.reservation, required this.update});

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: primariBlue,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => EndModal(
                      reservation: widget.reservation,
                      update: widget.update,
                    ),
                  );
                },
                child: Text(
                  'Termina',
                  style: semibold_16.copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.check,
                size: 24,
              ),
            ],
          ),
        )
      ],
    );
  }
}
