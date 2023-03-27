import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const BotonAzul({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 2,
        backgroundColor: Colors.blue,
        // background
      ),
      onPressed: onPressed,
      child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ))),
    );
  }
}
