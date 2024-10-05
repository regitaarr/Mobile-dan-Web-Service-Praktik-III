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
      home: const ListviewPage(),
    );
  }
}

class ListviewPage extends StatefulWidget {
  const ListviewPage({super.key});

  @override
  State<ListviewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListviewPage> {
  bool switchEnable = true;

  void onChangeSwitch({required bool value}) {
    setState(() {
      switchEnable = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(
              Icons.airplanemode_active_rounded,
            ),
            title: const Text(
              'Airplane Mode',
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: Transform.translate(
              offset: const Offset(10.0, 0.0),
              child: Switch(
                value: switchEnable,
                onChanged: (value) => onChangeSwitch(value: value),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.wifi_rounded,
            ),
            title: Text(
              'Wi-Fi',
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.bluetooth_rounded,
            ),
            title: Text(
              'Bluetooth',
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: Icon(Icons.chevron_right_outlined),
          ),
        ],
      )),
    );
  }
}
