import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class TabCard extends StatelessWidget {
  const TabCard({
    super.key,
    required this.title,
    required this.selected,
    required this.onPressed,
  });

  final String title;
  final bool selected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 98,
      decoration: BoxDecoration(
        color: selected ? AppColors.red : AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
