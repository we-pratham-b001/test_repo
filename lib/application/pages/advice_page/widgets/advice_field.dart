import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  final AdviceEntity advice;

  const AdviceField({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(10),
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Text(
          '"${advice.advice}"',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
