import 'package:flutter/material.dart';

class HomeSquare extends StatelessWidget {
  const HomeSquare({
    Key? key,
    required this.label,
    required this.size,
  }) : super(key: key);

  final String label;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
