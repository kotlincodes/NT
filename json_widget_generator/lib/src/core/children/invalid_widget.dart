import 'package:flutter/material.dart';

class InvalidWidget extends StatelessWidget {
  final String? text;

  const InvalidWidget({super.key, this.text});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(text ?? "Invalid Data "),
    )));
  }
}
