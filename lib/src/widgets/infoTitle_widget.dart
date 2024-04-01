import 'package:flutter/material.dart';

class infoTtile extends StatelessWidget {
  const infoTtile({super.key, required this.title, required this.caption});
  final String title;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(caption, style: const TextStyle(color: Colors.white70),)
      ],
    );
  }
}
