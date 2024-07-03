import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class ExpenseData extends StatelessWidget {
  const ExpenseData({
    super.key,
    required this.expence,
    required this.number,
  });

  final bool expence;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          expence ? 'Expense' : 'Income',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 18,
          width: 54,
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$number$userCurrency',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
