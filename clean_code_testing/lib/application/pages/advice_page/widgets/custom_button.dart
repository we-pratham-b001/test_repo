
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function? tap;
  const CustomButton({super.key,this.tap});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: (){
        tap?.call();
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 20,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Text(
              'Get Advice',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
