import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String label1;
  final String label2;

  const Labels(
      {super.key,
      required this.ruta,
      required this.label1,
      required this.label2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(label1,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 10),
        GestureDetector(
          child: Text(label2,
              style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushReplacementNamed(context, ruta);
          },
        )
      ]),
    );
  }
}
