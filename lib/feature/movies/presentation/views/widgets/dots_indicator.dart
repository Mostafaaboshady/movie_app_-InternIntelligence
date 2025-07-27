import 'package:flutter/material.dart';

class DotsIndecator extends StatelessWidget {
  const DotsIndecator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 32 : 8,
      decoration: ShapeDecoration(
        color: isActive ? Color(0xff064061) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
