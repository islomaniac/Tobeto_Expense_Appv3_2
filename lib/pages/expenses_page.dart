import 'package:expenseappv3/models/expense.dart';
import 'package:expenseappv3/widget/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenses = [
    Expense(name: "Yemek", price: 500, date: DateTime.now(), category: Category.food),
    Expense(name: "Udemy Kursu", price: 200, date: DateTime.now(), category: Category.work),
    Expense(name: "Giysi Alışverişi", price: 250.0, date: DateTime.now(), category: Category.dress),
    Expense(name: "Ulaşım", price: 30.0, date: DateTime.now(), category: Category.travel),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Grafik Bölümü"),
          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ExpenseItem(expenses[index]);
              },
            ),
          ),
          const SizedBox(
            height: 150,
            child: Text("Burası Bottom Bar"),
          )
        ],
      ),
    );
  }
}
