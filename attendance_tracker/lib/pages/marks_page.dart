import 'package:flutter/material.dart';

class MarksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marks Page'),
      ),
      body: Center(
        child: Text(
          'This is where you can view and manage marks.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
