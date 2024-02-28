import 'package:cloud_craft_solution/ui/screens/welcome_screen.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginRegisterHeader extends StatelessWidget {
  final String name;
  const LoginRegisterHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(200),
        ),
        color: Colors.white,
        gradient: primayGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 54),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
            const Center(
              child: Icon(
                Icons.lock,
                size: 100,
              ),
            ),
            Center(
              child: Text(
                name,
                style: bold_44.copyWith(
                  letterSpacing: 1.5,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
