import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:flutter/material.dart';

class BuildingCard extends StatelessWidget {
  final String img;
  final String name;

  const BuildingCard({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/new_reservation',
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          boxShadow: lightShadow,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey[300],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              child: Image.network(
                img,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black.withOpacity(0.7),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  name,
                  style: bold_20.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
