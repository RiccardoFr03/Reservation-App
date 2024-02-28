import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_craft_solution/data/repositories/graph_repository.dart';
import 'package:cloud_craft_solution/domain/models/user_reservation_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/check_button.dart';
import 'package:cloud_craft_solution/ui/widgets/edit_delete_button.dart';
import 'package:cloud_craft_solution/ui/widgets/profile_img_list.dart';
import 'package:cloud_craft_solution/ui/widgets/reservation_info.dart';
import 'package:cloud_craft_solution/ui/widgets/time_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetInfo extends StatefulWidget {
  final UserReservationModel reservation;
  final VoidCallback update;
  const BottomSheetInfo(
      {super.key, required this.reservation, required this.update});

  @override
  State<BottomSheetInfo> createState() => _BottomSheetInfoState();
}

class _BottomSheetInfoState extends State<BottomSheetInfo> {
  List<Uint8List> imgs = [];

  List<String> userEmails = [
    'riccardo.sterchele@itsincom.it',
    'andrea.frigerio@itsincom.it',
    'marianna.milani@itsincom.it',
    'andrea.valtulini@itsincom.it',
    'domenico.sironi@studenti.itsincom.it',
    'klaus.prelle@itsincom.it',
    'giacomo.tumminelli@itsincom.it',
    'andrea.ronzio@itsincom.it',
    'alessio.carbonieri@itsicnom.it',
  ];

  List<String> firstThreeEmails = [];

  @override
  void initState() {
    super.initState();
    fetchUserNames();
  }

  Future<void> fetchUserNames() async {
    Random random = Random();
    int randomNumber = random.nextInt(userEmails.length) + 1;
    userEmails.shuffle();
    List<String> firstThreeEmails = userEmails.sublist(0, randomNumber);
    for (String email in firstThreeEmails) {
      Uint8List name = await GraphRepository.getUserImg(email);
      setState(() {
        imgs.add(name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.reservation.isDesk == true ? 400 : 500,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              widget.reservation.isDesk
                  ? 'Desk'
                  : widget.reservation.reservationName,
              style: bold_24,
            ),
            const SizedBox(height: 16),
            ReservationInfo(
                icona: const Icon(Icons.apartment, size: 32),
                title: widget.reservation.buildingName),
            const SizedBox(height: 16),
            ReservationInfo(
                icona: const Icon(Icons.meeting_room, size: 32),
                title: widget.reservation.roomName),
            const SizedBox(height: 16),
            ReservationInfo(
                icona: const Icon(Icons.event, size: 32),
                title: DateFormat('dd/MM/yyyy')
                    .format(widget.reservation.dateTimeStart)),
            const SizedBox(height: 16),
            TimeInfo(
              start: widget.reservation.dateTimeStart,
              end: widget.reservation.dateTimeEnd,
              icona: const Icon(Icons.schedule, size: 32),
            ),
            height_24,
            Visibility(
              visible: widget.reservation.isDesk == false,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i = 0; i < imgs.length; i++)
                      ProfileImgList(img: imgs[i]),
                  ],
                ),
              ),
            ),
            height_4,
            widget.reservation.dateTimeStart.isAfter(DateTime.now())
                ? EditDeleteButton(
                    reservation: widget.reservation,
                    update: widget.update,
                  )
                : widget.reservation.dateTimeStart.isBefore(DateTime.now()) &&
                        widget.reservation.dateTimeEnd.isAfter(DateTime.now())
                    ? CheckButton(
                        reservation: widget.reservation, update: widget.update)
                    : Container(),
          ],
        ),
      ),
    );
  }
}
