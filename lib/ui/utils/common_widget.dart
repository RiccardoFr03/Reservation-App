import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:flutter/material.dart';

const SizedBox height_4 = SizedBox(height: 4);
const SizedBox height_8 = SizedBox(height: 8);
const SizedBox height_16 = SizedBox(height: 16);
const SizedBox height_24 = SizedBox(height: 24);
const SizedBox width_4 = SizedBox(width: 4);
const SizedBox width_8 = SizedBox(width: 8);
const SizedBox width_16 = SizedBox(width: 16);
const SizedBox width_24 = SizedBox(width: 24);
const SizedBox width_32 = SizedBox(width: 32);
const SizedBox width_40 = SizedBox(width: 40);

const Divider divider_1 = Divider(
  thickness: 1,
  height: 10,
  color: Colors.grey,
);

final lightShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.08),
    spreadRadius: 5,
    offset: const Offset(0, 2),
    blurRadius: 16,
  )
];

final imageShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.25),
    spreadRadius: 2,
    offset: const Offset(0, 2),
    blurRadius: 24,
  )
];

final selectedShadow = [
  BoxShadow(
    color: primariBlue,
    spreadRadius: 10,
    offset: const Offset(1, 2),
    blurRadius: 24,
  )
];

final currentReservation = [
  BoxShadow(
    color: primariBlue,
    spreadRadius: 5,
    offset: const Offset(0, 1),
    blurRadius: 24,
  )
];

final cardShadow = [
  BoxShadow(
      color: Colors.black.withAlpha(100),
      offset: const Offset(0, 2),
      blurRadius: 16)
];

enum ResType {
  desk,
  room,
}
