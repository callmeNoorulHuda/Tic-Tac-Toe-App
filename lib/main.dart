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
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      home: const HomeScreen(),
    );
  }
}
