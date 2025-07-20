import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/game_providers.dart';
import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => GameProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
