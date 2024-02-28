import 'package:cloud_craft_solution/domain/models/user_reservation_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/widgets/modals/delete_modal.dart';
import 'package:cloud_craft_solution/ui/widgets/modals/edit_modal.dart';
import 'package:flutter/material.dart';

class EditDeleteButton extends StatefulWidget {
  final UserReservationModel reservation;
  final VoidCallback update;
  const EditDeleteButton(
      {super.key, required this.reservation, required this.update});

  @override
  State<EditDeleteButton> createState() => _EditDeleteButtonState();
}

class _EditDeleteButtonState extends State<EditDeleteButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.reservation.isDesk == true
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: widget.reservation.isDesk == true ? false : true,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (BuildContext context) => EditModal(
                  reservation: widget.reservation,
                  update: widget.update,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: primaryOrange),
              child: Row(
                children: [
                  Text(
                    'Modifica',
                    style: semibold_16.copyWith(fontSize: 24),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.edit,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.red,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => DeleteModal(
                            reservation: widget.reservation,
                            update: widget.update,
                          ));
                },
                child: Text(
                  'Elimina',
                  style: semibold_16.copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.delete,
                size: 24,
              ),
            ],
          ),
        )
      ],
    );
  }
}
