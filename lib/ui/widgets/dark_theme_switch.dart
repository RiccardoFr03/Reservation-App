import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:flutter/material.dart';

class DarkThemeSwitch extends StatefulWidget {
  const DarkThemeSwitch({super.key});

  @override
  State<DarkThemeSwitch> createState() => _DarkThemeSwitchState();
}

class _DarkThemeSwitchState extends State<DarkThemeSwitch> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Icon(
            active ? Icons.dark_mode : Icons.light_mode,
            size: 24,
            color: Colors.white,
          ),
          width_40,
          Text(
            active ? 'Dark Mode' : 'Light Mode',
            style: semibold_18.copyWith(
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Switch(
            value: active,
            onChanged: (isDark) {
              setState(() {
                active = isDark;
              });
            },
            activeTrackColor: primariBlue,
            inactiveTrackColor: Colors.grey[400],
          ),
          width_16,
        ],
      ),
    );
  }
}
