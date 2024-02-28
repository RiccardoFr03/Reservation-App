import 'package:cloud_craft_solution/data/repositories/reservation_repository.dart';
import 'package:cloud_craft_solution/domain/models/reservation_date_model.dart';
import 'package:cloud_craft_solution/domain/models/room_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/widgets/choose_room_card.dart';
import 'package:cloud_craft_solution/ui/widgets/choose_room_header.dart';
import 'package:cloud_craft_solution/ui/widgets/loading_screen.dart';
import 'package:flutter/material.dart';

class RoomsScreen extends StatefulWidget {
  final ReservatiDateModel reservatiDateModel;
  const RoomsScreen({
    super.key,
    required this.reservatiDateModel,
  });

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  late Future<List<RoomModel>> freeRooms;

  @override
  void initState() {
    super.initState();
    freeRooms = ReservationRepository.getAllFreeRoom(ReservatiDateModel(
      buildingId: widget.reservatiDateModel.buildingId,
      dateStart: widget.reservatiDateModel.dateStart,
      dateEnd: widget.reservatiDateModel.dateEnd,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: freeRooms,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: _roomAppBar(context),
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
                        freeRooms = ReservationRepository.getAllFreeRoom(
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
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            children: [
                              if (snapshot.hasData && snapshot.data!.isNotEmpty)
                                ChooseRoomHeader(
                                  buildigName: snapshot.data![0].buildingName,
                                  dateStart:
                                      widget.reservatiDateModel.dateStart,
                                  dateEnd: widget.reservatiDateModel.dateEnd,
                                ),
                              if (snapshot.hasData && snapshot.data!.isNotEmpty)
                                for (var i = 0; i < snapshot.data!.length; i++)
                                  ChooseRoomCard(
                                      room: snapshot.data![i],
                                      reservatiDateModel:
                                          widget.reservatiDateModel)
                              else
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          4),
                                  child: Center(
                                    child: Text(
                                      "Non ci sono aule disponibili",
                                      style: bold_24,
                                    ),
                                  ),
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

  AppBar _roomAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Text(
        'Scegli una sala',
        style: bold_24,
      ),
    );
  }
}
