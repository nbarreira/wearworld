import 'package:flutter/material.dart';
import 'package:wear_plus/wear_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WatchShape(
          builder: (context, shape, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello world",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(shape==WearShape.round?16.0:8.0),
                  child: child!,
                ),
              ],
            );
          },
          child: AmbientMode(builder: (context, mode, child) {
            return mode == WearMode.active
                ? const ActivePage()
                : const AmbientPage();
          }),
        ),
      ),
    );
  }
}

class ActivePage extends StatefulWidget {
  const ActivePage({super.key});

  @override
  State<StatefulWidget> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You have pushed the button this many times:',
            textAlign: TextAlign.center,
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class AmbientPage extends StatelessWidget {
  const AmbientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Ambient page",
        textAlign: TextAlign.center,
      ),
    );
  }
}
