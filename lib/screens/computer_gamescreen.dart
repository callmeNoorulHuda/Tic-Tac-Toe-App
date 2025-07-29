import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/computer_game_provider.dart';

class ComputerGameScreen extends StatelessWidget {
  const ComputerGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ComputerGameProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Tic Tac Toe vs Computer")),
        body: Consumer<ComputerGameProvider>(
          builder: (context, gameProvider, child) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      String value = gameProvider.board[index];
                      return GestureDetector(
                        onTap: () => gameProvider.tapSquare(index),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 3, 0, 0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (gameProvider.winner != null)
                  Text(
                    gameProvider.winner == 'Draw'
                        ? "It's a Draw!"
                        : "Winner: ${gameProvider.winner}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => gameProvider.resetGame(),
                      child: const Text('Reset Game'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Exit to Menu'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
