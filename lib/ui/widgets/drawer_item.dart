import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool red;
  final VoidCallback? onPressed;

  const DrawerItem(
      {super.key,
      required this.name,
      required this.icon,
      required this.red,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: red ? Colors.red : Colors.white,
            ),
            const SizedBox(
              width: 40,
            ),
            Text(
              name,
              style: semibold_18.copyWith(
                color: red ? Colors.red : Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
