import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Expense {
  @HiveField(0)
  int id;
  @HiveField(1)
  String target;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String category;
  @HiveField(4)
  bool expense;

  Expense({
    required this.id,
    required this.target,
    required this.amount,
    required this.category,
    required this.expense,
  });
}

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final typeId = 0;

  @override
  Expense read(BinaryReader reader) {
    return Expense(
      id: reader.read(),
      target: reader.read(),
      amount: reader.read(),
      category: reader.read(),
      expense: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer.write(obj.id);
    writer.write(obj.target);
    writer.write(obj.amount);
    writer.write(obj.category);
    writer.write(obj.expense);
  }
}
