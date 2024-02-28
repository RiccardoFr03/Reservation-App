import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_craft_solution/data/repositories/graph_repository.dart';

import 'package:cloud_craft_solution/domain/user_info.dart';
import 'package:cloud_craft_solution/ui/screens/home_screen.dart';
import 'package:cloud_craft_solution/ui/screens/new_reservation_screen.dart';
import 'package:cloud_craft_solution/ui/screens/reservation_screen.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/widgets/my_drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../domain/notification_settings.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
  late Future<Uint8List> myImg;
  late Future<String> userName;
  late Future<String> userMail;

  Widget _curentScreen = const HomeScreen();
  final List<Widget> _screens = [
    const HomeScreen(),
    const NewReservationScreen(),
    const ReservationScreen()
  ];

  @override
  void initState() {
    super.initState();
    myImg = GraphRepository.getMyImage();
    userName = UserInfo.getUserName();
    userMail = UserInfo.getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24)),
                          child: FutureBuilder(
                            future: myImg,
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return Image.memory(
                                  snapshot.data ?? Uint8List(0),
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                );
                              } else {
                                return Image.network(
                                  'https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    FutureBuilder(
                        future: userName,
                        builder: (context, snapshot) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data ?? 'Utente',
                                style: bold_16,
                              ),
                              Text(
                                "Bentornato!",
                                style: semibold_14,
                              ),
                            ],
                          );
                        }),
                    const Spacer(),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        Future.delayed(const Duration(seconds: 1), () {
                          NotificationService().showNotification(
                              title: 'DevOps Meeting tra 10 minuti',
                              body: 'Edificio 1 - Sala 102');
                        });
                      },
                      icon: const Icon(
                        Icons.notifications,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      drawer: _selectedIndex == 0
          ? MyDrawer(
              img: myImg,
              userMail: userMail,
              userName: userName,
            )
          : null,
      body: _curentScreen,
      bottomNavigationBar: CurvedNavigationBar(
        color: primariBlue,
        height: 75,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _curentScreen = _screens[index];
          });
        },
        backgroundColor: Colors.white,
        //   backgroundColor: Colors.transparent,
        items: const [
          Icon(
            Icons.home,
            size: 28,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 36,
            color: Colors.white,
          ),
          Icon(
            Icons.local_activity,
            size: 28,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
