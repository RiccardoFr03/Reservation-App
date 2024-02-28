// ignore_for_file: use_build_context_synchronously

import 'package:cloud_craft_solution/data/repositories/reservation_repository.dart';
import 'package:cloud_craft_solution/domain/models/get_free_desk_model.dart';
import 'package:cloud_craft_solution/domain/models/post_reservation_model.dart';
import 'package:cloud_craft_solution/domain/models/reservation_date_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/choose_room_header.dart';
import 'package:cloud_craft_solution/ui/widgets/desk_legend.dart';
import 'package:cloud_craft_solution/ui/widgets/desk_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/elevated_button.dart';
import 'package:cloud_craft_solution/ui/widgets/loading_screen.dart';
import 'package:flutter/material.dart';

class DeskScreen extends StatefulWidget {
  final ReservatiDateModel reservatiDateModel;
  const DeskScreen({super.key, required this.reservatiDateModel});

  @override
  State<DeskScreen> createState() => _DeskScreenState();
}

class _DeskScreenState extends State<DeskScreen> {
  late Future<GetFreeDeskModel> res;

  @override
  void initState() {
    res = ReservationRepository.getAllFreeDesk(ReservatiDateModel(
      buildingId: widget.reservatiDateModel.buildingId,
      dateStart: widget.reservatiDateModel.dateStart,
      dateEnd: widget.reservatiDateModel.dateEnd,
    ));

    super.initState();
  }

  int selectedDesk = -1;
  int selectedDeskId = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: res,
      builder: (context, snapshot) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Visibility(
              visible: selectedDesk >= 0,
              child: MyElevatedButton(
                textColor: Colors.white,
                name: 'Conferma',
                onTap: () async {
                  postDeskReservation();
                },
                isGradinet: false,
                color: primariBlue,
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              'Scegli una postazione',
              style: bold_24,
            ),
          ),
          body: snapshot.hasError
              ? const Center(
                  child: Text("Error"),
                )
              : LoadingScreen(
                  isHome: false,
                  showLoader: !snapshot.hasData,
                  screen: RefreshIndicator(
                    onRefresh: () =>
                        Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        res = ReservationRepository.getAllFreeDesk(
                            ReservatiDateModel(
                          buildingId: widget.reservatiDateModel.buildingId,
                          dateStart: widget.reservatiDateModel.dateStart,
                          dateEnd: widget.reservatiDateModel.dateEnd,
                        ));
                      });
                    }),
                    color: Colors.black,
                    child: snapshot.hasData
                        ? ListView(
                            children: [
                              ChooseRoomHeader(
                                buildigName: 'Edificio 1',
                                dateStart: widget.reservatiDateModel.dateStart,
                                dateEnd: widget.reservatiDateModel.dateEnd,
                              ),
                              height_8,
                              const DeskLegend(),
                              height_24,
                              SizedBox(
                                height: 400,
                                width: MediaQuery.of(context).size.width,
                                child: GridView.builder(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          snapshot.data?.horizontalDesk ?? 5,
                                    ),
                                    itemCount: snapshot.data!.deskBools.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return DeskWidget(
                                        desk: snapshot.data!.deskBools[index],
                                        onPressed: () {
                                          setState(() {
                                            selectedDesk = index;
                                            selectedDeskId = snapshot
                                                .data!.deskBools[index].deskId;
                                          });
                                        },
                                        selected: selectedDesk == index
                                            ? true
                                            : false,
                                      );
                                    }),
                              ),
                            ],
                          )
                        : Container(),
                  ),
                ),
        );
      },
    );
  }

  void postDeskReservation() async {
    await ReservationRepository.postReservation(PostReservationModel(
            dateTimeStart: widget.reservatiDateModel.dateStart,
            dateTimeEnd: widget.reservatiDateModel.dateEnd,
            reservationName: '',
            roomId: selectedDeskId,
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
