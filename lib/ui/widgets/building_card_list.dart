import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:flutter/material.dart';

class BuildingCardList extends StatefulWidget {
  final String img;
  final String name;
  final VoidCallback? function;
  final bool selectes;
  const BuildingCardList(
      {super.key,
      required this.img,
      required this.name,
      this.function,
      required this.selectes});

  @override
  State<BuildingCardList> createState() => _BuildingCardListState();
}

class _BuildingCardListState extends State<BuildingCardList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, bottom: 16),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: widget.selectes ? selectedShadow : imageShadow,
              ),
              child: Image.network(
                widget.img,
                width: 168,
                height: 260,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.blueGrey.shade900,
                    width: 168,
                    height: 260,
                    child: const Icon(
                      Icons.apartment,
                      color: Colors.white,
                      size: 48,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: widget.selectes
                      ? primariBlue.withOpacity(0.7)
                      : Colors.black.withOpacity(0.7),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.name,
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
