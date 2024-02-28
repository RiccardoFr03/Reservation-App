import 'package:cloud_craft_solution/data/repositories/buildin_repository.dart';
import 'package:cloud_craft_solution/domain/models/building_model.dart';
import 'package:cloud_craft_solution/domain/models/reservation_date_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:cloud_craft_solution/ui/utils/date_formatter.dart';
import 'package:cloud_craft_solution/ui/widgets/building_card_list.dart';
import 'package:cloud_craft_solution/ui/widgets/calendar_app_bar.dart';
import 'package:cloud_craft_solution/ui/widgets/desk_reservation_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/elevated_button.dart';
import 'package:cloud_craft_solution/ui/widgets/loading_screen.dart';
import 'package:cloud_craft_solution/ui/widgets/reservation_type.dart';
import 'package:cloud_craft_solution/ui/widgets/room_reservation_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewReservationScreen extends StatefulWidget {
  const NewReservationScreen({super.key});

  @override
  State<NewReservationScreen> createState() => _NewReservationScreenState();
}

class _NewReservationScreenState extends State<NewReservationScreen> {
  int selectedBuilding = 0;
  int selectedBuildingId = 60;
  ResType reservationType = ResType.desk;
  DateTime dateStart = MyDateFormatter.allDayStart(DateTime.now());
  DateTime dateEnd = MyDateFormatter.allDayEnd(DateTime.now());
  DateTime selectedDay = DateTime.now();

  void updateData(DateTime newDate) {
    setState(() {
      selectedDay = newDate;
    });
  }

  void updateDateStart(DateTime date) {
    setState(() {
      dateStart = date;
    });
  }

  void updateDateEnd(DateTime date) {
    setState(() {
      dateEnd = date;
    });
  }

  late Future<List<BuildingModel>> building;

  @override
  void initState() {
    super.initState();
    building = BuildingRepository.getAllBuilding();
  }

  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  void goToSelectedDate() {
    _controller.animateToFocusDate();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: building,
      builder: (context, snapshot) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: MyElevatedButton(
              textColor: Colors.white,
              name: 'Verifica Disponibilità',
              onTap: () {
                dateStart = DateTime(selectedDay.year, selectedDay.month,
                    selectedDay.day, dateStart.hour, dateStart.minute);
                dateEnd = DateTime(selectedDay.year, selectedDay.month,
                    selectedDay.day, dateEnd.hour, dateEnd.minute);
                if (reservationType == ResType.desk) {
                  Navigator.of(context).pushNamed('/desks',
                      arguments: ReservatiDateModel(
                        buildingId: selectedBuildingId,
                        dateEnd: dateEnd,
                        dateStart: dateStart,
                      ));
                } else {
                  Navigator.of(context).pushNamed('/free_rooms',
                      arguments: ReservatiDateModel(
                        buildingId: selectedBuildingId,
                        dateEnd: dateEnd,
                        dateStart: dateStart,
                      ));
                }
              },
              isGradinet: false,
              color: primariBlue,
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 0,
            toolbarHeight: 120,
            automaticallyImplyLeading: false,
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Row(
                    children: [
                      Text(
                        MyDateFormatter.titleDate(selectedDay),
                        style: bold_20,
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          updateData(selectedDay);
                                          goToSelectedDate();
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Conferma',
                                          style: semibold_16.copyWith(
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        child: CupertinoDatePicker(
                                          minimumDate: DateTime.now().subtract(
                                              const Duration(minutes: 1)),
                                          initialDateTime: selectedDay,
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged: (date) {
                                            setState(
                                              () {
                                                updateData(date);
                                                goToSelectedDate();
                                              },
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(
                            Icons.calendar_month,
                            size: 32,
                          )),
                    ],
                  ),
                ),
                CalendarAppBar(
                  myController: _controller,
                  goToSelectedDate: goToSelectedDate,
                  dateArgs: selectedDay,
                  updateData: (date) => updateData(date),
                ),
              ],
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
                        building =
                            building = BuildingRepository.getAllBuilding();
                      });
                    }),
                    child: snapshot.hasData
                        ? ListView(
                            clipBehavior: Clip.none,
                            padding: const EdgeInsets.all(16),
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                child: ListView(
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    for (var i = 0;
                                        i < snapshot.data!.length;
                                        i++)
                                      BuildingCardList(
                                        img: snapshot.data![i].linkImage,
                                        name: snapshot.data![i].name,
                                        function: () {
                                          setState(() {
                                            selectedBuilding = i;
                                            selectedBuildingId =
                                                snapshot.data![i].buildingId;
                                          });
                                        },
                                        selectes: selectedBuilding == i
                                            ? true
                                            : false,
                                      ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ReservationType(
                                    selected: reservationType == ResType.desk,
                                    function: () {
                                      setState(() {
                                        reservationType = ResType.desk;
                                        dateStart = MyDateFormatter.allDayStart(
                                            selectedDay);
                                        dateEnd = MyDateFormatter.allDayEnd(
                                            selectedDay);
                                      });
                                    },
                                    icona: FaIcon(
                                      FontAwesomeIcons.solidUser,
                                      size: 44,
                                      color: reservationType == ResType.desk
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    title: 'Desk',
                                  ),
                                  ReservationType(
                                    selected: reservationType == ResType.room,
                                    function: () {
                                      setState(() {
                                        reservationType = ResType.room;
                                        dateStart = MyDateFormatter.dateNow(
                                            selectedDay)!;
                                        dateEnd = MyDateFormatter.dateNow(
                                                selectedDay)!
                                            .add(const Duration(minutes: 30));
                                      });
                                    },
                                    icona: FaIcon(
                                      FontAwesomeIcons.users,
                                      size: 44,
                                      color: reservationType == ResType.room
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    title: 'Sala Riunione',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Visibility(
                                visible: reservationType == ResType.desk,
                                child: DeskReservation(
                                    dateStart: (selectedDay) =>
                                        updateDateStart(selectedDay),
                                    dateEnd: (selectedDay) =>
                                        updateDateEnd(selectedDay),
                                    data: selectedDay),
                              ),
                              Visibility(
                                  visible: reservationType == ResType.room,
                                  child: RoomReservation(
                                      functionDateStart: (selectedDay) =>
                                          updateDateStart(selectedDay),
                                      functionDateEnd: (selectedDay) =>
                                          updateDateEnd(selectedDay),
                                      data: selectedDay))
                            ],
                          )
                        : Container(),
                  ),
                ),
        );
      },
    );
  }
}
