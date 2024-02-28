import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MicrosoftCard extends StatelessWidget {
  final Color color;
  const MicrosoftCard({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Login con Microsoft',
          style: semibold_16.copyWith(color: color, fontSize: 20),
        ), //
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/microsoft.svg",
                  height: 48,
                ),
                Text(
                  'Microsoft',
                  style: semibold_16.copyWith(color: color),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
