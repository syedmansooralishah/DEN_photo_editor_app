import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the HomeScreen widget
import 'edit_screen.dart'; // Import the EditScreen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Editor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Set the HomeScreen as the initial screen
      debugShowCheckedModeBanner: false, // Disable the debug banner
    );
  }
}
