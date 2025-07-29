import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_providers.dart';

class PlayerGameScreen extends StatelessWidget {
  const PlayerGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Tic Tac Toe")),
      body: Column(
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
                  ? 'It\'s a Draw!'
                  : 'Winner: ${gameProvider.winner}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ElevatedButton(
            onPressed: () {
              gameProvider.resetGame();
            },
            child: Text('Reset Game'),
          ),
        ],
      ),
    );
  }
}
