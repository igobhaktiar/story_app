import 'package:flutter/material.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Write Screen'),
      ),
    );
  }
}
