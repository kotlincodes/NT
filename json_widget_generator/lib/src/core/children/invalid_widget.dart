import 'package:flutter/material.dart';

class InvalidWidget extends StatelessWidget {
  final String? text;

  const InvalidWidget({super.key, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(child: Text(text ?? "Invalid Data ")),
      width: double.infinity,
    );
  }
}
