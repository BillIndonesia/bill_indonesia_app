import 'package:flutter/material.dart';

class NumpadButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const NumpadButton({
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white12,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF36B8B6),
              Color(0xFF0485AC),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
