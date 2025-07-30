import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/computer_game_provider.dart';

class ComputerGameScreen extends StatelessWidget {
  const ComputerGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ComputerGameProvider(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 241, 109, 99),
                const Color.fromARGB(255, 113, 174, 223),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 0.5],
            ),
          ),
          child: Consumer<ComputerGameProvider>(
            builder: (context, gameProvider, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Player \n   vs \nComputer",
                      style: GoogleFonts.pressStart2p(
                        textStyle: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          String value = gameProvider.board[index];
                          return GestureDetector(
                            // Restored GestureDetector
                            onTap: () => gameProvider.tapSquare(index),
                            child: Container(
                              decoration: BoxDecoration(
                                border: _getBorders(index),
                              ),
                              child: Center(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: value == "X"
                                        ? const Color.fromARGB(255, 232, 22, 6)
                                        : const Color.fromARGB(
                                            255,
                                            4,
                                            139,
                                            249,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (gameProvider.winner != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          gameProvider.winner == 'Draw'
                              ? "It's a Draw!"
                              : "Winner: ${gameProvider.winner == "X" ? "Player" : "Computer"}",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,

                            textStyle: TextStyle(fontSize: 22),
                          ),
                          onPressed: () => gameProvider.resetGame(),
                          child: const Text('Reset Game'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            textStyle: TextStyle(fontSize: 22),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Exit to Menu'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Helper function to define internal borders only (bold)
  Border _getBorders(int index) {
    // Define borders for internal cells (no outer borders)
    bool isLeft = index % 3 != 0; // Add left border if not first column
    bool isTop = index > 2; // Add top border if not first row

    return Border(
      left: isLeft
          ? const BorderSide(width: 5.0, color: Colors.black)
          : BorderSide.none,
      top: isTop
          ? const BorderSide(width: 5.0, color: Colors.black)
          : BorderSide.none,
    );
  }
}
