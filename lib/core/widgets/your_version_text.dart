import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class YourVersionText extends StatelessWidget {
  const YourVersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Your version...',
          style: TextStyle(
            color: AppColors.white50,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
