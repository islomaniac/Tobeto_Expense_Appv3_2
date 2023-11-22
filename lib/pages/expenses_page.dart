import 'package:expenseappv3/models/expense.dart';
import 'package:expenseappv3/widget/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage(this.expenses, this.onRemove, this.onInsert, {Key? key}) : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  final void Function(Expense expense) onInsert;

  @override
  // ignore: library_private_types_in_public_api
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 150,
          child: Text(
            "Grafik Bölümü",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(widget.expenses[index]),
                  child: ExpenseItem(widget.expenses[index]),
                  onDismissed: (direction) {
                    Expense removedExpense = widget.expenses[index];
                    widget.onRemove(removedExpense);
                    //widget.onRemove(widget.expenses[index]);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Harcama Silindi!',
                          style: TextStyle(fontSize: 17),
                        ),
                        action: SnackBarAction(
                          label: 'Geri Al',
                          onPressed: () {
                            setState(() {
                              widget.onInsert(removedExpense);
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
        )
      ]),
    );
  }
}
