import 'package:flutter/material.dart';
import 'screens/player_gamescreen.dart';
import 'screens/computer_gamescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Welcome to Tic Tac Toe", style: TextStyle(fontSize: 30)),
              SizedBox(height: 100),

              ElevatedButton(
                style: ElevatedButton.styleFrom(),

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
      ),
    );
  }
}
