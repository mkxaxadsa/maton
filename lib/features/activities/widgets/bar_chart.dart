import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class BarChartCard extends StatelessWidget {
  const BarChartCard({
    super.key,
    required this.title,
    required this.incomeHeight,
    required this.expenseHeight,
  });

  final String title;
  final double incomeHeight;
  final double expenseHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 7,
                height: incomeHeight,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 7,
                height: expenseHeight,
                decoration: BoxDecoration(
                  color: AppColors.white50,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
