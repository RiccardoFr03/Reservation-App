/*import 'package:cloud_craft_solution/data/repositories/reservation_repository.dart';
import 'package:cloud_craft_solution/domain/models/reservation_date_model.dart';
import 'package:cloud_craft_solution/domain/models/room_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/widgets/choose_room_header.dart';
import 'package:cloud_craft_solution/ui/widgets/loading_screen.dart';
import 'package:flutter/material.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  late Future<List<RoomModel>> freeRoom;

  @override
  void initState() {
    super.initState();
    freeRoom = ReservationRepository.getAllFreeDesk(
        ReservatiDateModel(
            dateStart: DateTime.now(), dateEnd: DateTime.now(), isDesk: false));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: freeRoom,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: _homeAppBar(context),
          body: snapshot.hasError
              ? const Center(
                  child: Text("Error"),
                )
              : LoadingScreen(
                  showLoader: !snapshot.hasData,
                  screen: RefreshIndicator(
                    onRefresh: () =>
                        Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        freeRoom = ReservationRepository.getAllFreeDesk(
            
                            ReservatiDateModel(
                              buildingId: 2,
                                dateStart: DateTime.now(),
                                dateEnd: DateTime.now(),
                                isDesk: false));
                      });
                    }),
                    color: Colors.black,
                    child: snapshot.hasData
                        ? ListView(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            children: const [
                              ChooseRoomHeader(dateStart: ,),
                              //     ChooseRoomCard(),
                            ],
                          )
                        : Container(),
                  ),
                ),
        );
      },
    );
  }

  AppBar _homeAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      title: const Text("My app"),
      titleTextStyle: bold_24.copyWith(color: Colors.white),
    );
  }
  /*
        Navigator.of(context).pushNamed(
        '/home',
      );

      */
}
*/