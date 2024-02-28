import 'package:cloud_craft_solution/data/repositories/reservation_repository.dart';
import 'package:cloud_craft_solution/domain/models/user_reservation_by_day_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/widgets/loading_screen.dart';
import 'package:cloud_craft_solution/ui/widgets/reservation_list.dart';
import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  late Future<List<UserReservationByDay>> userReservationByDay;

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(microseconds: 1), () {
      setState(() {
        userReservationByDay =
            ReservationRepository.getReservationByUserIdByDate();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    userReservationByDay = userReservationByDay =
        ReservationRepository.getReservationByUserIdByDate();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userReservationByDay,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: _reservationAppBar(context),
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
                        userReservationByDay = userReservationByDay =
                            ReservationRepository
                                .getReservationByUserIdByDate();
                      });
                    }),
                    color: Colors.black,
                    child: snapshot.hasData
                        ? ListView(
                            children: [
                              if (snapshot.hasData && snapshot.data!.isNotEmpty)
                                for (var i = 0; i < snapshot.data!.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: ReservationList(
                                      update: _refreshData,
                                      userReservationByDay: snapshot.data![i],
                                    ),
                                  )
                              else
                                Center(
                                  child: Text(
                                    "Non hai prenotazioni",
                                    style: bold_24,
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

  AppBar _reservationAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        'Le Mie Prenotazioni',
        style: bold_24,
      ),
    );
  }
}
