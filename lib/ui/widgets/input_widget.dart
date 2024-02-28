import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/validators.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final bool obscureText;
  final VoidCallback? onIconTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool autoValidate;

  const InputWidget(
      {super.key,
      required this.label,
      required this.hint,
      this.icon,
      required this.obscureText,
      this.onIconTap,
      this.validator,
      this.controller,
      required this.autoValidate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: semibold_16,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator ?? requiredValidator,
            autovalidateMode:
                autoValidate ? AutovalidateMode.onUserInteraction : null,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              labelStyle: regular_10,
              hintText: hint,
              hintStyle: semibold_16,
              suffixIcon: icon != null
                  ? GestureDetector(
                      onTap: onIconTap,
                      child: Icon(
                        icon,
                        size: 32,
                      ),
                    )
                  : null,
              border: InputBorder.none,
              iconColor: Colors.black,
              errorMaxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
