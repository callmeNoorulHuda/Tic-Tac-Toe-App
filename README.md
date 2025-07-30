# Tic Tac Toe (Flutter)

A classic Tic Tac Toe game built with Flutter featuring:
- Player vs Computer mode with AI (Minimax algorithm)
- Dynamic UI with Google Fonts
- State management using `ChangeNotifier`

## Features

- 🎮 Two game modes: Player vs Player & Player vs Computer
- 🤖 Smart computer opponent using Minimax algorithm
- 🎨 Custom UI with animated transitions
- 🔄 State management via `ChangeNotifier`
- ✨ Modern design with Google Fonts

## Installation

1. Ensure you have Flutter installed (v3.0.0 or later)
2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/tic-tac-toe-flutter.git
   cd tic-tac-toe-flutter
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- `flutter`: SDK
- `provider`: ^6.0.5 (for state management)
- `google_fonts`: ^4.0.4 (for custom typography)

## Game Logic Highlights

### Computer AI (Minimax Algorithm)
The computer uses the Minimax algorithm to make optimal moves:
```dart
int minimax(List<String> board, int depth, bool isMaximizing) {
  // Implementation details...
}
```

### State Management
Game state is managed using `ChangeNotifier`:
```dart
class ComputerGameProvider extends ChangeNotifier {
  // Game state variables
  void tapSquare(int index) {
    // Handle player moves
    notifyListeners();
  }
}
```

## Folder Structure

```
lib/
├── main.dart          # App entry point
├── screens/
│   ├── home_screen.dart
│   ├── player_game_screen.dart
│   └── computer_game_screen.dart
└── providers/
    ├── computer_game_provider.dart  # Game logic
    └── game_providers.dart  # Game logic

```

## How to Play

1. Choose game mode from home screen
2. Tap any empty square to place your mark (X)
3. Computer (O) will automatically respond
4. First to get 3 in a row wins!

## Customization

To change styles:
1. Modify colors in `computer_game_provider.dart`
2. Update fonts in `home_screen.dart`

## License

MIT License - Free to use and modify