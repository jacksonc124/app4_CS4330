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
  bool _showDog = false;
  Offset _dogPosition = const Offset(100, 100);

  void _toggleDog() {
    setState(() {
      _showDog = true;
    });
  }

  void _updateDogPosition(PointerEvent event) {
    setState(() {
      _dogPosition = event.position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _updateDogPosition,
      child: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Jackson Cogan',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Screen One',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: ElevatedButton(
              onPressed: _toggleDog,
              child: const Text('Add Dog'),
            ),
          ),
          if (_showDog)
            Positioned(
              left: _dogPosition.dx - 50,
              top: _dogPosition.dy - 50,
              child: Image.asset(
                'images/dog.gif', 
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
