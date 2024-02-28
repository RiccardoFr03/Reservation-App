// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously

import 'package:cloud_craft_solution/data/repositories/reservation_repository.dart';
import 'package:cloud_craft_solution/domain/models/post_reservation_model.dart';
import 'package:cloud_craft_solution/domain/models/room_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:cloud_craft_solution/ui/utils/validators.dart';
import 'package:cloud_craft_solution/ui/widgets/elevated_button.dart';
import 'package:cloud_craft_solution/ui/widgets/input_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/reservation_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetRoomInfo extends StatefulWidget {
  final RoomModel room;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  const BottomSheetRoomInfo(
      {super.key,
      required this.room,
      required this.dateStart,
      required this.dateEnd});

  @override
  State<BottomSheetRoomInfo> createState() => _BottomSheetRoomInfoState();
}

class _BottomSheetRoomInfoState extends State<BottomSheetRoomInfo> {
  final controllerReservationName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.room.name,
                style: bold_24,
              ),
            ),
            height_8,
            Text(
              widget.room.description,
              style: semibold_18,
            ),
            const SizedBox(height: 16),
            ReservationInfo(
                icona: const Icon(Icons.apartment, size: 32),
                title: widget.room.buildingName),
            const SizedBox(height: 16),
            ReservationInfo(
                icona: const Icon(Icons.event, size: 32),
                title: DateFormat('dd/MM/yyyy').format(widget.dateStart!)),
            const SizedBox(height: 16),
            ReservationInfo(
                icona: const Icon(Icons.person, size: 32),
                title: 'x ${widget.room.seats}'),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dai un nome alla riunione',
                              style: bold_20,
                            ),
                            Form(
                              key: formKey,
                              child: InputWidget(
                                hint: 'Riunione Aziendale',
                                label: '',
                                obscureText: false,
                                controller: controllerReservationName,
                                icon: Icons.group,
                                onIconTap: () {},
                                validator: requiredValidator,
                                autoValidate: false,
                              ),
                            ),
                            height_24,
                            MyElevatedButton(
                              name: 'Conferma',
                              onTap: () async {
                                if (formKey.currentState?.validate() == true) {
  
                                  postRoomReservation();
                                }
                              },
                              isGradinet: false,
                              textColor: Colors.white,
                              color: primariBlue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: primariBlue),
                    child: Row(
                      children: [
                        Text(
                          'Conferma',
                          style: semibold_16.copyWith(fontSize: 24),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.check,
                          size: 34,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            height_4,
          ],
        ),
      ),
    );
  }

  void postRoomReservation() async {
    await ReservationRepository.postReservation(PostReservationModel(
            dateTimeStart: widget.dateStart,
            dateTimeEnd: widget.dateEnd,
            reservationName: controllerReservationName.text,
            roomId: widget.room.roomId,
            userEmail: ''))
        .then((value) {
      Navigator.of(context).pushNamed('/home');
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
      Navigator.of(context).pushNamed('/home');
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
