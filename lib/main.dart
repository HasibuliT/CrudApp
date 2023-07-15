import 'package:crud/Screen/ProductCreateScreen.dart';
import 'package:crud/Screen/ProductGridViewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //Application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.cyan,
        ),
        primaryColor: Colors.yellow[200],
      ),

      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.purple,
        ),
        primaryColor: Colors.red[200],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Crud App',
      //home: ProductCreateScreen(),
      home: ProductGridViewScreen(
      ),
    );
  }
}
