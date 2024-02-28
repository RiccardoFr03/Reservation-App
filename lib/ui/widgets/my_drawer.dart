import 'dart:typed_data';

import 'package:cloud_craft_solution/data/repositories/auth_repository.dart';

import 'package:cloud_craft_solution/ui/screens/profile_screen.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/dark_theme_switch.dart';
import 'package:cloud_craft_solution/ui/widgets/drawer_item.dart';
import 'package:cloud_craft_solution/ui/widgets/face_id_switch.dart';
import 'package:cloud_craft_solution/ui/widgets/notfication_widget.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  final Future<Uint8List> img;
  final Future<String> userName;
  final Future<String> userMail;

  const MyDrawer(
      {super.key,
      required this.img,
      required this.userName,
      required this.userMail});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool faceId = true;
  void _logout() {
    AuthRepository.azureLogout().then((value) {
      Navigator.of(context).pushNamed(
        '/welcome',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width - 75,
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              headerWidget(widget.img, widget.userName, widget.userMail),
              height_24,
              divider_1,
              height_24,
              DrawerItem(
                red: false,
                name: 'Azienda',
                icon: Icons.apartment,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              height_24,
              DrawerItem(
                  red: false,
                  name: 'Admin',
                  icon: Icons.person,
                  onPressed: () => onItemPressed(context, index: 1)),
              height_24,
              DrawerItem(
                  red: false,
                  name: 'Assistenza',
                  icon: Icons.message_outlined,
                  onPressed: () => onItemPressed(context, index: 2)),
              height_24,
              divider_1,
              height_24,
              const FaceIdSwitch(),
              height_24,
              const NotificationWidget(),
              height_24,
              const DarkThemeSwitch(),
              const Spacer(),
              DrawerItem(
                red: true,
                name: 'Log out',
                icon: Icons.logout,
                onPressed: () => _logout(),
              ),
              height_24,
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProfileImageWidget()));
        break;
    }
  }

  Widget headerWidget(Future<Uint8List> img, final Future<String> userName,
      final Future<String> userMail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          child: FutureBuilder(
            future: img,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Image.memory(
                  snapshot.data ?? Uint8List(0),
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                );
              } else {
                return Image.network(
                  'https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                );
              }
            },
          ),
        ),
        height_16,
        Column(
          children: [
            FutureBuilder(
                future: widget.userName,
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? 'Utente',
                      style: semibold_18.copyWith(color: Colors.white));
                }),
            const SizedBox(
              height: 8,
            ),
            FutureBuilder(
                future: widget.userMail,
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? 'utente@itsincom.it',
                      style: semibold_18.copyWith(color: Colors.white));
                }),
            const SizedBox(
              height: 8,
            ),
            Text('Junior Developer',
                style: semibold_18.copyWith(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
