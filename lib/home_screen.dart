import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              Text(
                "Welcome to \nTic Tac Toe",
                style: GoogleFonts.pressStart2p(
                  textStyle: TextStyle(fontSize: 25),
                ),
              ),

              SizedBox(height: 100),

              SizedBox(
                width: 300,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,

                    textStyle: TextStyle(fontSize: 22),
                  ),

                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PlayerGameScreen(),
                      ),
                    );
                  },
                  child: Text("Player vs Player"),
                ),
              ),
              SizedBox(height: 50),

              SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(fontSize: 22),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ComputerGameScreen(),
                      ),
                    );
                  },
                  child: const Text("Player vs Computer"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
