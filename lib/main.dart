import 'package:expenseappv3/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme colorShceme1 = ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorShceme1,
        cardTheme: CardTheme(
          color: colorShceme1.onPrimaryContainer,
        ),
        appBarTheme: AppBarTheme(
          color: colorShceme1.onPrimaryContainer,
          foregroundColor: colorShceme1.primaryContainer,
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontWeight: FontWeight.bold),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    ),
  );
}


//modelleme