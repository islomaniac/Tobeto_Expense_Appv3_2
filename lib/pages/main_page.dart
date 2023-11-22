import 'package:expenseappv3/models/expense.dart';
import 'package:expenseappv3/pages/expenses_page.dart';
import 'package:expenseappv3/widget/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Expense> expenses = [
    Expense(name: "Yemek", price: 500.529, date: DateTime.now(), category: Category.food),
    Expense(name: "Udemy Kursu", price: 200, date: DateTime.now(), category: Category.work),
    Expense(name: "Kıyafet", price: 200, date: DateTime.now(), category: Category.dress),
    Expense(name: "Gezi", price: 200, date: DateTime.now(), category: Category.travel),
    Expense(name: "Elektronik", price: 300, date: DateTime.now(), category: Category.travel),
    Expense(name: "Kitap", price: 50, date: DateTime.now(), category: Category.work),
    Expense(name: "Gıda", price: 150, date: DateTime.now(), category: Category.food),
  ];

  List<Expense> insertExpenses = [];

  addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  removeExpense(Expense expense) {
    setState(() {
      insertExpenses.add(expense);
      expenses.remove(expense);
    });
  }

  insertExpense(Expense expense) {
    setState(() {
      if (insertExpenses.isNotEmpty) {
        addExpense(insertExpenses.last);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense App"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewExpense(addExpense);
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ExpensesPage(expenses, removeExpense, insertExpense),
    );
  }
}
