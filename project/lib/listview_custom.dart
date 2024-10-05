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
      home: const ListviewCustomPage(),
    );
  }
}

class ListviewCustomPage extends StatefulWidget {
  const ListviewCustomPage({super.key});

  @override
  State<ListviewCustomPage> createState() => _ListViewCustomPageState();
}

class _ListViewCustomPageState extends State<ListviewCustomPage> {
  List<String> listData = List<String>.generate(100, (index) => 'Data $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView Custom',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: ListView.custom(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            dense: true,
            title: Text(
              listData[index],
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          childCount: listData.length,
        ),
      )),
    );
  }
}
