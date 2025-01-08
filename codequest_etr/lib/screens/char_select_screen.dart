import 'package:flutter/material.dart';
import 'package:codequest_etr/screens/game_screen.dart';

// Character selection screen
class CharSelectScreen extends StatelessWidget {
  const CharSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Sets the background color of the screen
      appBar: AppBar(
        title: Text(
          'Choose Your Character', // Title displayed in the app bar
          style: TextStyle(
            fontFamily: 'PressStart2P', // Custom font for retro aesthetics
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black, // App bar background color
        elevation: 8, // Adds shadow below the app bar
        centerTitle: true, // Centers the title
      ),
      body: SingleChildScrollView( // Allows scrolling in case of overflow
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
            children: [
              const SizedBox(height: 40), // Adds space above character options
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centers character options horizontally
                children: [
                  // Character 1 - Blaze
                  GestureDetector(
                    onTap: () { // Defines the action when Blaze is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GameScreen(characterName: 'Blaze'), // Passes "Blaze" to GameScreen
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Transform.scale(
                          scale: 1.8, // Enlarges the character image
                          child: Image.asset(
                            'assets/characters/char1.png', // Path to Blaze's image
                            width: 220,
                            height: 220,
                          ),
                        ),
                        const SizedBox(height: 10), // Adds space between image and name
                        Text(
                          'Blaze', // Blaze's name displayed below the image
                          style: TextStyle(
                            fontFamily: 'PressStart2P', // Matches title font
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), // Adds space between characters

                  // Character 2 - Cherry
                  GestureDetector(
                    onTap: () { // Defines the action when Cherry is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GameScreen(characterName: 'Cherry'), // Passes "Cherry" to GameScreen
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Transform.scale(
                          scale: 1.8, // Enlarges the character image
                          child: Image.asset(
                            'assets/characters/char2.png', // Path to Cherry's image
                            width: 220,
                            height: 220,
                          ),
                        ),
                        const SizedBox(height: 10), // Adds space between image and name
                        Text(
                          'Cherry', // Cherry's name displayed below the image
                          style: TextStyle(
                            fontFamily: 'PressStart2P', // Matches title font
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), // Adds space between characters

                  // Character 3 - Aegis
                  GestureDetector(
                    onTap: () { // Defines the action when Aegis is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GameScreen(characterName: 'Aegis'), // Passes "Aegis" to GameScreen
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Transform.scale(
                          scale: 1.8, // Enlarges the character image
                          child: Image.asset(
                            'assets/characters/char3.png', // Path to Aegis's image
                            width: 220,
                            height: 220,
                          ),
                        ),
                        const SizedBox(height: 10), // Adds space between image and name
                        Text(
                          'Aegis', // Aegis's name displayed below the image
                          style: TextStyle(
                            fontFamily: 'PressStart2P', // Matches title font
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
