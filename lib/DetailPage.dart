import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imagePath;

  const DetailPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Color(0xFF5db9ff),
      ),
      body: Center(
        child: Image.asset(imagePath), // Display the image in full size
      ),
    );
  }
}
