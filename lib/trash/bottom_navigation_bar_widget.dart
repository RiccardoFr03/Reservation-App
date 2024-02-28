/*
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavigationBar extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNavigationBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.black,
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        gap: 12,
        padding: const EdgeInsets.all(20),
        textStyle: bold_14,
        iconSize: 28,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.local_activity,
            text: 'Prenotazioni',
          ),
        ],
      ),
    );
  }
}
*/