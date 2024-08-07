import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom/custom_app_bar.dart';
import '../../../core/widgets/custom/custom_scaffold.dart';
import '../../../core/widgets/dialogs/dialog_widget.dart';
import '../../../core/widgets/your_version_field.dart';
import '../../../core/widgets/your_version_text.dart';
import '../bloc/expense_bloc.dart';
import '../models/expense.dart';
import '../widgets/amount_field.dart';
import '../widgets/category_card.dart';
import '../widgets/field_title_text.dart';
import '../widgets/target_field.dart';

class ExpenseEditPage extends StatefulWidget {
  const ExpenseEditPage({super.key, required this.expense});

  final Expense expense;

  @override
  State<ExpenseEditPage> createState() => _ExpenseEditPageState();
}

class _ExpenseEditPageState extends State<ExpenseEditPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = true;
  bool selected = false;

  bool getSelected(String title) {
    return controller3.text == title;
  }

  void checkActive() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else if (controller3.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onEdit() {
    context.read<ExpenseBloc>().add(
          EditExpenseEvent(
            expense: Expense(
              id: widget.expense.id,
              target: controller1.text,
              amount: int.parse(controller2.text),
              category: controller3.text,
              expense: widget.expense.expense,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          title: widget.expense.expense
              ? 'Delete this Expense?'
              : 'Delete this Income?',
          onYes: () {
            context
                .read<ExpenseBloc>()
                .add(DeleteExpenseEvent(id: widget.expense.id));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.expense.target;
    controller2.text = widget.expense.amount.toString();
    controller3.text = widget.expense.category;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomAppBar(onDelete: onDelete),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                Center(
                  child: Text(
                    widget.expense.expense ? 'Edit Expense' : 'Edit Income',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const FieldTitleText('Add Target'),
                const SizedBox(height: 6),
                TargetField(
                  controller: controller1,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 6),
                const FieldTitleText('Amount'),
                const SizedBox(height: 6),
                AmountField(
                  controller: controller2,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 6),
                const FieldTitleText('Category'),
                const SizedBox(height: 6),
                CategoryCard(
                  title: 'Salary',
                  controller: controller3,
                  selected: getSelected('Salary'),
                  onSelected: checkActive,
                ),
                const SizedBox(height: 6),
                CategoryCard(
                  title: 'Rent',
                  controller: controller3,
                  selected: getSelected('Rent'),
                  onSelected: checkActive,
                ),
                const SizedBox(height: 6),
                CategoryCard(
                  title: 'Freelance',
                  controller: controller3,
                  selected: getSelected('Freelance'),
                  onSelected: checkActive,
                ),
                const SizedBox(height: 6),
                CategoryCard(
                  title: 'Passive',
                  controller: controller3,
                  selected: getSelected('Passive'),
                  onSelected: checkActive,
                ),
                const SizedBox(height: 6),
                CategoryCard(
                  title: 'Business',
                  controller: controller3,
                  selected: getSelected('Business'),
                  onSelected: checkActive,
                ),
                const SizedBox(height: 6),
                CategoryCard(
                  title: 'Royalty',
                  controller: controller3,
                  selected: getSelected('Royalty'),
                  onSelected: checkActive,
                ),
                const SizedBox(height: 6),
                const YourVersionText(),
                const SizedBox(height: 6),
                YourVersionField(
                  controller: controller3,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 23),
                PrimaryButton(
                  title: 'Let\'s go',
                  active: active,
                  onPressed: onEdit,
                ),
                const SizedBox(height: 23),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
