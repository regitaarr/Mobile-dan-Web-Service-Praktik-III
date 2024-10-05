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
      home: const ListviewSeparatedPage(),
    );
  }
}

class ListviewSeparatedPage extends StatefulWidget {
  const ListviewSeparatedPage({super.key});

  @override
  State<ListviewSeparatedPage> createState() => _ListviewSeparatedPageState();
}

class _ListviewSeparatedPageState extends State<ListviewSeparatedPage> {
  List<String> listData = List<String>.generate(100, (index) => 'data $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView Separated',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: ListView.separated(
        itemCount: listData.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => ListTile(
          dense: true,
          title: Text(
            listData[index],
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 0.0,
        ),
      )),
    );
  }
}
