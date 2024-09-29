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
      home: const SizedboxPage(),
    );
  }
}

class SizedboxPage extends StatefulWidget {
  const SizedboxPage({super.key});

  @override
  State<SizedboxPage> createState() => _SizedboxPageState();
}

class _SizedboxPageState extends State<SizedboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SizedBox',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This text and'),
                Text('the next text have no distance'),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This text end'),
                SizedBox(
                  width: 24.0,
                ),
                Text('The next text have distance'),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.black,
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.pink,
                )
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 24.0,
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.pink,
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
