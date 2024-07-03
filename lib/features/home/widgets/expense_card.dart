import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project5/core/utils.dart';

import '../../../core/config/app_colors.dart';
import '../../expense/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(32),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push('/expense-edit', extra: expense);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 20),
            SizedBox(
              width: 81,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    expense.target,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SFPro',
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    width: 65,
                    color: Colors.white,
                  ),
                  Text(
                    expense.category,
                    style: TextStyle(
                      color: expense.expense ? AppColors.red : AppColors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SFPro',
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              '${expense.amount}$userCurrency',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'SFPro',
              ),
            ),
            const Spacer(),
            const SizedBox(width: 21),
            Container(
              height: 26,
              width: 71,
              decoration: BoxDecoration(
                color: expense.expense ? AppColors.red : AppColors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  expense.expense ? 'Expense' : 'Income',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SFPro',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 9),
          ],
        ),
      ),
    );
  }
}
