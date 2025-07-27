import 'package:flutter/material.dart';

class MoviesFailureWigets extends StatelessWidget {
  const MoviesFailureWigets({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errMessage),
    );
  }
}
