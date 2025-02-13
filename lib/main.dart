import 'dart:math'; // Import dart:math for random number generation
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree(),
  ];

  void _nextScreen() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _screens.length;
    });
  }

  void _previousScreen() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _screens.length) % _screens.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter App 4 (3 People 5 Commits Each)'),
        actions: [
          IconButton(
            icon: const Row(
              children: [
                Icon(Icons.arrow_forward),
                Icon(Icons.arrow_right),
              ],
            ),
            onPressed: _nextScreen,
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _previousScreen,
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  List<Offset> _dogPositions = [];
  List<String> _dogImages = [];
  Color _backgroundColor = Colors.white; // Default background color

  // List of image files in the images folder
  final List<String> _availableDogImages = [
    'images/dog.png', 
    'images/dog4.png',
    'images/dog5.png',
    'images/dog6.png',
    'images/dog7.png',
    'images/dog8.png',
    'images/dog9.png'
  ];

  void _addDog() {
    setState(() {
      // Generate a random position
      Offset randomPosition = Offset(
        Random().nextDouble() * (MediaQuery.of(context).size.width - 100), // Random x position
        Random().nextDouble() * (MediaQuery.of(context).size.height - 100), // Random y position
      );

      // Randomly select a dog image
      String randomImage = _availableDogImages[Random().nextInt(_availableDogImages.length)];

      // Add the new dog’s position and image to the list
      _dogPositions.add(randomPosition);
      _dogImages.add(randomImage);
    });
  }

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Color.fromRGBO(
        Random().nextInt(256), // Random red value
        Random().nextInt(256), // Random green value
        Random().nextInt(256), // Random blue value
        1.0, // Opacity (1.0 is fully opaque)
      );
    });
  }

  void _reset() {
    setState(() {
      _dogPositions.clear(); // Clear all dog positions
      _dogImages.clear(); // Clear all dog images
      _backgroundColor = Colors.white; // Reset background color to white
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor, // Apply random background color
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Jackson Cogan',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0), letterSpacing: 10, fontFamily: "SuperFont", ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 280,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: ElevatedButton(
              onPressed: _addDog,
              child: const Text('Add Dog'),
            ),
          ),
          Positioned(
            bottom: 240,
            left: MediaQuery.of(context).size.width / 2 - 105,
            child: ElevatedButton(
              onPressed: _changeBackgroundColor, // Change background color
              child: const Text('Change Background Color'),
            ),
          ),
          Positioned(
            bottom: 200,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: ElevatedButton(
              onPressed: _reset, // Reset the screen
              child: const Text('Reset'),
            ),
          ),
          // Display all dogs at their respective positions
          for (int i = 0; i < _dogPositions.length; i++)
            Positioned(
              left: _dogPositions[i].dx,
              top: _dogPositions[i].dy,
              child: Image.asset(
                _dogImages[i],
                width: 100,
                height: 100,
              ),
            ),
        ],
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Screen Two',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Screen Three',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
