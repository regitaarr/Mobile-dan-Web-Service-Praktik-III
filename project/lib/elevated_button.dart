import 'dart:developer';
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
      home: const ElevatedButtonPage(),
    );
  }
}

class ElevatedButtonPage extends StatefulWidget {
  const ElevatedButtonPage({super.key});

  @override
  State<ElevatedButtonPage> createState() => _ElevatedButtonPageState();
}

class _ElevatedButtonPageState extends State<ElevatedButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Elevated Button',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => log('Button clicked'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                  child: const Text('Click Me')),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                  onPressed: () => log('Button clicked'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Click Me')),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 48.0,
                child: ElevatedButton.icon(
                  onPressed: () => log('Button clicked'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Click Me'),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
