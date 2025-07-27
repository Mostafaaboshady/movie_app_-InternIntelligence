import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          suffixIcon:
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          label: const Text('Search'),
          hintText: 'Inter Name Movies',
          enabledBorder: methodOutlineBorder(),
          focusedBorder: methodOutlineBorder()),
    );
  }

  OutlineInputBorder methodOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
