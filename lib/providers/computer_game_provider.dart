import 'package:flutter/material.dart';

class ComputerGameProvider extends ChangeNotifier {
  List<String> _board = List.filled(9, '');
  String _currentPlayer = 'X';
  String? _winner;

  List<String> get board => _board;
  String get currentPlayer => _currentPlayer;
  String? get winner => _winner;

  Color color = Colors.red;

  void tapSquare(int index) {
    if (_board[index] == '' && _winner == null && _currentPlayer == 'X') {
      _board[index] = 'X';
      checkWinner();

      if (_winner == null) {
        _currentPlayer = 'O';
        notifyListeners();
        Future.delayed(Duration(seconds: 1)).then((_) {
          computerMove();
        }); // computer move after player
      }
    }
  }

  void computerMove() async {
    if (_winner != null) return;

    // Find best move using minimax
    int bestScore = -1000;
    int bestMove = -1;

    for (int i = 0; i < 9; i++) {
      if (_board[i] == '') {
        _board[i] = 'O';
        int score = minimax(_board, 0, false);
        _board[i] = '';

        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    // Make best move
    if (bestMove != -1) {
      _board[bestMove] = 'O';
      checkWinner();

      if (_winner == null) {
        _currentPlayer = 'X';
      }
      notifyListeners();
    }
  }

  int minimax(List<String> board, int depth, bool isMaximizing) {
    String? result = checkWinnerForMinimax(board);
    if (result != null) {
      if (result == 'O') return 10 - depth; // prefer faster wins
      if (result == 'X') return depth - 10; // prefer slower losses
      if (result == 'Draw') return 0;
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'O';
          int score = minimax(board, depth + 1, false);
          board[i] = '';
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'X';
          int score = minimax(board, depth + 1, true);
          board[i] = '';
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  String? checkWinnerForMinimax(List<String> board) {
    List<List<int>> winPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pos in winPositions) {
      String a = board[pos[0]];
      String b = board[pos[1]];
      String c = board[pos[2]];

      if (a != '' && a == b && b == c) {
        return a;
      }
    }

    if (!board.contains('')) {
      return 'Draw';
    }

    return null;
  }

  void checkWinner() {
    String? result = checkWinnerForMinimax(_board);
    if (result != null) {
      _winner = result;
      notifyListeners();
    }
  }

  void resetGame() {
    _board = List.filled(9, '');
    _currentPlayer = 'X';
    _winner = null;
    notifyListeners();
  }
}

// Helper functions for min/max since dart:math min/max only work with numbers
int max(int a, int b) => (a > b) ? a : b;
int min(int a, int b) => (a < b) ? a : b;
