import 'package:flutter/material.dart';
import 'package:la_barbearia/screens/home/home.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData.light().colorScheme
      ),
      darkTheme: ThemeData(colorScheme: ThemeData.dark().colorScheme),
    ),
  );
}
