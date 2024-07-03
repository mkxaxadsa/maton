import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../features/expense/models/expense.dart';

bool onboarding = true;
String userName = '';
String userCurrency = '\$';
int userExpense = 0;
int userIncome = 0;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  userName = prefs.getString('userName') ?? 'User';
  userCurrency = prefs.getString('userCurrency') ?? '\$';
  userExpense = prefs.getInt('userExpense') ?? 0;
  userIncome = prefs.getInt('userIncome') ?? 0;

  log(onboarding.toString());
  log(userName);
  log(userCurrency);
  log(userExpense.toString());
  log(userIncome.toString());
}

Future<void> saveUser(String name, String currency) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userName', name);
  prefs.setString('userCurrency', currency);
  prefs.setBool('onboarding', false);
  await getData();
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String getCurrentWeekDay() {
  DateTime now = DateTime.now();
  int currentWeekday = now.weekday;
  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  String currentWeekdayName = weekdays[currentWeekday - 1];
  return currentWeekdayName;
}

List<Expense> expensesList = [];
int dayExpenses = 0;
int w1Expenses = 0;
int w2Expenses = 0;
int w3Expenses = 0;
int w4Expenses = 0;
int w5Expenses = 0;
int w6Expenses = 0;
int w7Expenses = 0;
int m1Expenses = 0;
int m2Expenses = 0;
int m3Expenses = 0;
int m4Expenses = 0;
int y1Expenses = 0;

int dayIncomes = 0;
int w1Incomes = 0;
int w2Incomes = 0;
int w3Incomes = 0;
int w4Incomes = 0;
int w5Incomes = 0;
int w6Incomes = 0;
int w7Incomes = 0;
int m1Incomes = 0;
int m2Incomes = 0;
int m3Incomes = 0;
int m4Incomes = 0;
int y1Incomes = 0;

void calculateExpenses() {
  dayExpenses = 0;
  w1Expenses = 0;
  w2Expenses = 0;
  w3Expenses = 0;
  w4Expenses = 0;
  w5Expenses = 0;
  w6Expenses = 0;
  w7Expenses = 0;
  m1Expenses = 0;
  m2Expenses = 0;
  m3Expenses = 0;
  m4Expenses = 0;
  y1Expenses = 0;

  dayIncomes = 0;
  w1Incomes = 0;
  w2Incomes = 0;
  w3Incomes = 0;
  w4Incomes = 0;
  w5Incomes = 0;
  w6Incomes = 0;
  w7Incomes = 0;
  m1Incomes = 0;
  m2Incomes = 0;
  m3Incomes = 0;
  m4Incomes = 0;
  y1Incomes = 0;

  for (Expense expense in expensesList) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(expense.id * 1000);
    if (expense.expense) {
      if (date.day == DateTime.now().day) {
        dayExpenses = dayExpenses + expense.amount;
      }
      if (date.weekday == DateTime.now().weekday) {
        if (getWeekDay(date) == 1) w1Expenses = w1Expenses + expense.amount;
        if (getWeekDay(date) == 2) w2Expenses = w2Expenses + expense.amount;
        if (getWeekDay(date) == 3) w3Expenses = w3Expenses + expense.amount;
        if (getWeekDay(date) == 4) w4Expenses = w4Expenses + expense.amount;
        if (getWeekDay(date) == 5) w5Expenses = w5Expenses + expense.amount;
        if (getWeekDay(date) == 6) w6Expenses = w6Expenses + expense.amount;
        if (getWeekDay(date) == 7) w7Expenses = w7Expenses + expense.amount;
      }
      if (date.month == DateTime.now().month) {
        if (getWeekNumber(date) == 1) m1Expenses = m1Expenses + expense.amount;
        if (getWeekNumber(date) == 2) m2Expenses = m2Expenses + expense.amount;
        if (getWeekNumber(date) == 3) m3Expenses = m3Expenses + expense.amount;
        if (getWeekNumber(date) == 4) m4Expenses = m4Expenses + expense.amount;
      }
      if (date.year == DateTime.now().year) {
        y1Expenses = y1Expenses + expense.amount;
      }
    } else {
      if (date.day == DateTime.now().day) {
        dayIncomes = dayIncomes + expense.amount;
      }
      if (date.weekday == DateTime.now().weekday) {
        if (getWeekDay(date) == 1) w1Incomes = w1Incomes + expense.amount;
        if (getWeekDay(date) == 2) w2Incomes = w2Incomes + expense.amount;
        if (getWeekDay(date) == 3) w3Incomes = w3Incomes + expense.amount;
        if (getWeekDay(date) == 4) w4Incomes = w4Incomes + expense.amount;
        if (getWeekDay(date) == 5) w5Incomes = w5Incomes + expense.amount;
        if (getWeekDay(date) == 6) w6Incomes = w6Incomes + expense.amount;
        if (getWeekDay(date) == 7) w7Incomes = w7Incomes + expense.amount;
      }
      if (date.month == DateTime.now().month) {
        if (getWeekNumber(date) == 1) m1Incomes = m1Incomes + expense.amount;
        if (getWeekNumber(date) == 2) m2Incomes = m2Incomes + expense.amount;
        if (getWeekNumber(date) == 3) m3Incomes = m3Incomes + expense.amount;
        if (getWeekNumber(date) == 4) m4Incomes = m4Incomes + expense.amount;
      }
      if (date.year == DateTime.now().year) {
        y1Incomes = y1Incomes + expense.amount;
      }
    }
  }

  log('CURRENT DAY EXPENSES = $dayExpenses');
  log('CURRENT DAY INCOMES = $dayIncomes');
}

double getHeight(int a, int b) {
  if (a == 0) return 7;
  if (b == 0) return 7;
  if (a > b) return 100 + 50;
  return (a / b) * 100 + (a / b) * 50;
}

int getWeekNumber(DateTime date) {
  int firstDayWeekday = date.weekday;
  int dayOfMonth = date.day;
  int weekNumber = ((dayOfMonth + firstDayWeekday - 2) ~/ 7) + 1;
  log('WEEK NUMBER = $weekNumber');
  return weekNumber;
}

int getWeekDay(DateTime date) {
  int day = date.weekday;
  return day;
}

void getExpenses(List<Expense> expenses) {
  int expense = 0;
  int income = 0;
  expensesList = [];
  for (Expense e in expenses) {
    if (e.expense) {
      expense = expense + e.amount;
    } else {
      income = income + e.amount;
    }
    expensesList.add(e);
  }
  userExpense = expense;
  userIncome = income;
  calculateExpenses();
}
