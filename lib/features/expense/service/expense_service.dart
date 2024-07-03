import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/expense.dart';

class ExpenseService {
  List<Expense> expenses = [];

  Future<List<Expense>> getExpenses() async {
    final box = await Hive.openBox('expensebox');
    List expenses2 = box.get('expenses') ?? [];
    expenses = expenses2.cast<Expense>();
    log(expenses.length.toString());
    return expenses;
  }

  Future<List<Expense>> updateExpenses() async {
    final box = await Hive.openBox('expensebox');
    box.put('expenses', expenses);
    expenses = await box.get('expenses');
    return expenses;
  }
}
