import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List<String> _board = List.filled(9, "");
  String _currentPlayer = "X";
  String? _winner;

  List<String> get board => _board;
  String get currentPlayer => _currentPlayer;
  String? get winner => _winner;

  void tapSquare(int index) {
    if (_board[index].isEmpty && _winner == null) {
      _board[index] = _currentPlayer;
      checkWinner();
      _currentPlayer = _currentPlayer == "X" ? "O" : "X";
      notifyListeners();
    }
  }

  void checkWinner() {
    List<List<int>> winPositions = [
      [0, 1, 2], // Row 1
      [3, 4, 5], // Row 2
      [6, 7, 8], // Row 3
      [0, 3, 6], // Col 1
      [1, 4, 7], // Col 2
      [2, 5, 8], // Col 3
      [0, 4, 8], // Diagonal
      [2, 4, 6], // Diagonal
    ];

    for (var pos in winPositions) {
      String a = _board[pos[0]];
      String b = _board[pos[1]];
      String c = _board[pos[2]];

      if (a != '' && a == b && b == c) {
        _winner = a; // Either 'X' or 'O'
        notifyListeners();
        return;
      }
    }

    // Check for Draw
    if (!_board.contains('')) {
      _winner = 'Draw';
      notifyListeners();
    }
  }

  void resetGame() {
    _board = List.filled(9, "");
    _currentPlayer = "X";
    _winner = null;
    notifyListeners();
  }
}
