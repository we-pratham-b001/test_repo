import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;
  const ErrorMessage({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, color: Colors.red, size: 50),
        SizedBox(height: 20),
        Text(
          errorMessage,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
