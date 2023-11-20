import 'package:expenseappv3/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _expenseNameController = TextEditingController();
  final _expensePriceController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;
  // ignore: unused_element
  void _openDatePicker() async {
    DateTime today = DateTime.now();
    DateTime oneYearAgo = DateTime(today.year - 1, today.month, today.day);
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate == null ? today : _selectedDate!,
      firstDate: oneYearAgo,
      lastDate: today,
    );
    setState(() {
      _selectedDate = selectedDate;
    });
  }

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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _expensePriceController,
                    decoration: const InputDecoration(
                      labelText: "Harcama Miktarı",
                      prefixText: "₺",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _openDatePicker(),
                  icon: const Icon(Icons.calendar_month),
                ),
                Text(_selectedDate == null ? "Tarih Seçiniz" : DateFormat.yMd().format(_selectedDate!)),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(value: category, child: Text(category.name));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) _selectedCategory = value;
                    });
                  },
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Kapat"),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print("Değer ${_expenseNameController.text}");
                      // ignore: avoid_print
                      print("Değer ${_expensePriceController.text}");
                    },
                    child: const Text("Ekle"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
