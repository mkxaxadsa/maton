import 'package:flutter/material.dart';

import '../../expense/models/expense.dart';
import 'expense_card.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        children: [
          ...List.generate(
            expenses.length,
            (index) {
              return ExpenseCard(expense: expenses[index]);
            },
          ),
        ],
      ),
    );
  }
}
