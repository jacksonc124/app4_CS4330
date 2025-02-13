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
        Random().nextDouble() *
            (MediaQuery.of(context).size.width - 100), // Random x position
        Random().nextDouble() *
            (MediaQuery.of(context).size.height - 100), // Random y position
      );

      // Randomly select a dog image
      String randomImage =
          _availableDogImages[Random().nextInt(_availableDogImages.length)];

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
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 10,
                    fontFamily: "SuperFont",
                  ),
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

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  List<Offset> _dogPositions = [];
  List<String> _dogImages = [];
  List<Offset> _iconPositions = [];
  List<IconData> _icons = [];
  Color _backgroundColor = Colors.blue;

  final List<String> _availableDogImages = [
    'images/dog.png',
    'images/dog4.png',
    'images/dog5.png',
    'images/dog6.png',
    'images/dog7.png',
    'images/dog8.png',
    'images/dog9.png'
  ];

  final List<IconData> _availableIcons = [
    Icons.star,
    Icons.favorite,
    Icons.cake,
    Icons.directions_car,
    Icons.sports_basketball,
    Icons.computer,
    Icons.headset,
  ];

  void _addDog() {
    setState(() {
      Offset randomPosition = Offset(
        Random().nextDouble() * (MediaQuery.of(context).size.width - 100),
        Random().nextDouble() * (MediaQuery.of(context).size.height - 100),
      );

      String randomImage =
          _availableDogImages[Random().nextInt(_availableDogImages.length)];

      _dogPositions.add(randomPosition);
      _dogImages.add(randomImage);
    });
  }

  void _addIcon() {
    setState(() {
      Offset randomPosition = Offset(
        Random().nextDouble() * (MediaQuery.of(context).size.width - 50),
        Random().nextDouble() * (MediaQuery.of(context).size.height - 50),
      );

      IconData randomIcon =
          _availableIcons[Random().nextInt(_availableIcons.length)];

      _iconPositions.add(randomPosition);
      _icons.add(randomIcon);
    });
  }

  void _clearScreen() {
    setState(() {
      _dogPositions.clear();
      _dogImages.clear();
      _iconPositions.clear();
      _icons.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          Center(
            child: Text(
              'Kyler Martin-Yeboah',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                letterSpacing: 8,
                fontFamily: "SuperFont",
                shadows: [
                  Shadow(
                      offset: Offset(3, 3),
                      blurRadius: 2,
                      color: Colors.greenAccent.withOpacity(0.7)),
                  Shadow(
                      offset: Offset(-3, -3),
                      blurRadius: 2,
                      color: const Color.fromARGB(141, 135, 3, 229)
                          .withOpacity(0.5)),
                ],
              ),
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
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: ElevatedButton(
              onPressed: _addIcon,
              child: const Text('Add Icon'),
            ),
          ),
          Positioned(
            bottom: 200,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: ElevatedButton(
              onPressed: _clearScreen,
              child: const Text('Clear Screen'),
            ),
          ),
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
          for (int i = 0; i < _iconPositions.length; i++)
            Positioned(
              left: _iconPositions[i].dx,
              top: _iconPositions[i].dy,
              child: Icon(
                _icons[i],
                size: 50,
                color: Colors.white,
                shadows: [
                  Shadow(
                      offset: Offset(4, 4),
                      blurRadius: 4,
                      color: Colors.yellowAccent.withOpacity(0.7)),
                  Shadow(
                      offset: Offset(-2, -2),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.5)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
