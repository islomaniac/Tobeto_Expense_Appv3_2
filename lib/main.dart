import 'package:expenseappv3/models/expense.dart';
import 'package:flutter/material.dart';

void main() {
  Expense expense = Expense(name: "Harcama", price: 500, date: DateTime.now());
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(),
  ));
}


//modelleme