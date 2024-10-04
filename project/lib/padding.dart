import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Note',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PaddingPage(),
    );
  }
}

class PaddingPage extends StatefulWidget {
  const PaddingPage({super.key});

  @override
  State<PaddingPage> createState() => _PaddingPageState();
}

class _PaddingPageState extends State<PaddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Padding',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.red.shade100,
              child: const Text('Widget Tanpa Padding'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Material(
              color: Colors.yellow.shade100,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Widget Dengan Padding',
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Material(
              color: Colors.green.shade100,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: Text('Widget Dengan Padding'),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Material(
              color: Colors.blue.shade100,
              child: const Padding(
                padding: EdgeInsets.only(
                    left: 32.0, right: 16.0, top: 16.0, bottom: 8.0),
                child: Text('Widget Dengan Padding'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
