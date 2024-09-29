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
      home: const CenterPage(),
    );
  }
}

class CenterPage extends StatefulWidget {
  const CenterPage({super.key});

  @override
  State<CenterPage> createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Center',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('This text is in the center of the screen'),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              width: 200.0,
              height: 100.0,
              color: Colors.black,
              child: const Text(
                'Text without center',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              width: 200.0,
              height: 100.0,
              color: Colors.pink,
              child: const Center(
                child: Text(
                  'Text with center',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
