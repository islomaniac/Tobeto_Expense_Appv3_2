// ignore_for_file: public_member_api_docs, sort_constructors_first

// id => identifier => kimlik belirliyici

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  final String id;
  final String name;
  final double price;
  final DateTime date;
  Expense({
    required this.name,
    required this.price,
    required this.date,
  }) : id = const Uuid().v4();
}
