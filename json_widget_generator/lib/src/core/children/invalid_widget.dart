import 'package:flutter/material.dart';

class InvalidWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(child: Text("Invalid Data ")),
      width: double.infinity,
    );
  }
}
