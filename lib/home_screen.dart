import 'package:flutter/material.dart';
import 'screens/player_gamescreen.dart';
import 'screens/computer_gamescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tic Tac Toe")),
      body: Center(
        child: Column(
          children: [
            Text("Welcome to Tic Tac Toe"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PlayerGameScreen(),
                  ),
                );
              },
              child: const Text("Play vs Player"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ComputerGameScreen(),
                  ),
                );
              },
              child: const Text("Play vs Computer"),
            ),
          ],
        ),
      ),
    );
  }
}
