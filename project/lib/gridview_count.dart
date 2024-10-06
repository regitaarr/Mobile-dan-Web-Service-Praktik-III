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
      home: const GridViewCountPage(),
    );
  }
}

class GridViewCountPage extends StatefulWidget {
  const GridViewCountPage({super.key});

  @override
  State<GridViewCountPage> createState() => _GridViewCountPageState();
}

class _GridViewCountPageState extends State<GridViewCountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GridView Count',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          children: List.generate(
            50,
            (index) => Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Product $index',
                  style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
