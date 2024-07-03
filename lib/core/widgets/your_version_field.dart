import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/app_colors.dart';

class YourVersionField extends StatelessWidget {
  const YourVersionField({
    super.key,
    required this.controller,
    this.hintText = '...',
    this.maxLen = 15,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final int maxLen;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLen),
            ],
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.white50,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: (value) {
              controller.text = value;
              onChanged();
            },
          ),
        ),
      ],
    );
  }
}
