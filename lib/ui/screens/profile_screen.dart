import 'dart:typed_data';

import 'package:cloud_craft_solution/data/repositories/graph_repository.dart';
import 'package:cloud_craft_solution/ui/widgets/profile_img_list.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  List<Uint8List> imgs = [];

  List<String> userEmails = [
    'riccardo.ferrero@itsincom.it',
    'riccardo.sterchele@itsincom.it',
    'andrea.frigerio@itsincom.it',
    'marianna.milani@itsincom.it',
    'luca.maffini@itsincom.it'
  ];

  @override
  void initState() {
    super.initState();
    fetchUserNames();
  }

  Future<void> fetchUserNames() async {
    for (String email in userEmails) {
      Uint8List name = await GraphRepository.getUserImg(email);
      setState(() {
        imgs.add(name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nomi Utenti'),
        ),
        body: ListView(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.all(16),
            children: [
              SizedBox(
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
            ]));
  }
}
