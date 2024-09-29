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
      home: const ExpandedPage(),
    );
  }
}

class ExpandedPage extends StatefulWidget {
  const ExpandedPage({super.key});

  @override
  State<ExpandedPage> createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expanded',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("The container below don't use expansion"),
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
                  width: 16.0,
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
            const Text('The container below uses expansion'),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
