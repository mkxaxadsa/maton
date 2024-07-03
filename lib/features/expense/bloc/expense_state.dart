part of 'expense_bloc.dart';

abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpensesLoadedState extends ExpenseState {
  final List<Expense> expenses;

  ExpensesLoadedState({required this.expenses});
}
