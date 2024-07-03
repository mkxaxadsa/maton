import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class FieldTitleText extends StatelessWidget {
  const FieldTitleText(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.white50,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
