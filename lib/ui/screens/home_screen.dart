import 'dart:async';

import 'package:cloud_craft_solution/data/repositories/holiday_repository.dart';
import 'package:cloud_craft_solution/data/repositories/reservation_repository.dart';
import 'package:cloud_craft_solution/domain/models/holiday_model.dart';
import 'package:cloud_craft_solution/domain/models/user_reservation_by_day_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/widgets/carousel_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/loading_screen.dart';
import 'package:cloud_craft_solution/ui/widgets/reservation_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<UserReservationByDay>> userReservationByDay;
  late Future<List<HolidayModel>> listHoliday;

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        userReservationByDay =
            ReservationRepository.getReservationByUserIdByDate();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    userReservationByDay = ReservationRepository.getReservationByUserIdByDate();
    listHoliday = HolidayRepository.getAllHoliday();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          listHoliday = HolidayRepository.getAllHoliday();
          userReservationByDay =
              ReservationRepository.getReservationByUserIdByDate();
        });
      }),
      color: Colors.black,
      child: ListView(
        children: [
          FutureBuilder(
            future: listHoliday,
            builder: (context, snapshot) {
              return snapshot.hasError
                  ? const Center(
                      child: Text("Error"),
                    )
                  : LoadingScreen(
                      isHome: true,
                      showLoader: false,
                      screen: snapshot.hasData
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 156,
                                  width: MediaQuery.of(context).size.width,
                                  child:
                                      CarouselWidget(holidays: snapshot.data!),
                                )
                              ],
                            )
                          : Container(),
                    );
            },
          ),
          FutureBuilder(
            future: userReservationByDay,
            builder: (context, snapshot) {
              var itemLength = (snapshot.data?.length ?? 0) > 2
                  ? 2
                  : (snapshot.data?.length ?? 0);
              return snapshot.hasError
                  ? const Center(
                      child: Text("Error"),
                    )
                  : LoadingScreen(
                      isHome: true,
                      showLoader: !snapshot.hasData,
                      screen: snapshot.hasData
                          ? Column(
                              children: [
                                if (snapshot.hasData &&
                                    snapshot.data!.isNotEmpty)
                                  for (var i = 0; i < itemLength; i++)
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: ReservationList(
                                        userReservationByDay: snapshot.data![i],
                                        update: _refreshData,
                                      ),
                                    )
                                else
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                4),
                                    child: Center(
                                      child: Text(
                                        "Non hai prenotazioni",
                                        style: bold_24,
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          : Container(),
                    );
            },
          ),
        ],
      ),
    );
  }
}
