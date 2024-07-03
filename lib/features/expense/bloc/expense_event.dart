part of 'expense_bloc.dart';

abstract class ExpenseEvent {}

class GetExpensesEvent extends ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent {
  final Expense expense;
  AddExpenseEvent({required this.expense});
}

class EditExpenseEvent extends ExpenseEvent {
  final Expense expense;
  EditExpenseEvent({required this.expense});
}

class DeleteExpenseEvent extends ExpenseEvent {
  final int id;
  DeleteExpenseEvent({required this.id});
}
