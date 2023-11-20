import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _expenseNameController = TextEditingController();
  final _expensePriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _expenseNameController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text("Harcama Adı"),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _expensePriceController,
              decoration: const InputDecoration(
                label: Text("Harcama Miktarı"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print("Değer ${_expenseNameController.text}");
                  print("Değer ${_expensePriceController.text}");
                },
                child: const Text("Ekle"))
          ],
        ),
      ),
    );
  }
}
