import 'package:flutter/material.dart';
import 'package:project/detail.dart';

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
      home: const PushremoveuntilNavigationPage(),
    );
  }
}

class PushremoveuntilNavigationPage extends StatefulWidget {
  const PushremoveuntilNavigationPage({super.key});

  @override
  State<PushremoveuntilNavigationPage> createState() =>
      _PushremoveuntilNavigationPageState();
}

class _PushremoveuntilNavigationPageState
    extends State<PushremoveuntilNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Push Removeuntil Navigation',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage(),
              ),
              (route) => false,
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: const Text('Go to Detail Page'),
          ),
        ),
      ),
    );
  }
}
