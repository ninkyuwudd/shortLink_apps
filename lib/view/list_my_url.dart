import 'package:flutter/material.dart';

class MyListUrl extends StatefulWidget {
  const MyListUrl({super.key});

  @override
  State<MyListUrl> createState() => _MyListUrlState();
}

class _MyListUrlState extends State<MyListUrl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My URL"),
      ),
    );
  }
}
