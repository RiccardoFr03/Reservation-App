import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProfileImgList extends StatefulWidget {
  final Uint8List img;
  const ProfileImgList({super.key, required this.img});

  @override
  State<ProfileImgList> createState() => _ProfileImgListState();
}

class _ProfileImgListState extends State<ProfileImgList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, bottom: 16),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(96),
            ),
            child: Image.memory(
              widget.img,
              width: 96,
              height: 96,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.blueGrey.shade900,
                  width: 96,
                  height: 96,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 48,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
