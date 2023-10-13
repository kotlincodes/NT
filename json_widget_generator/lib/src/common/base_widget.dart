import 'package:flutter/material.dart';
import 'package:json_widget_generator/json_widget_generator.dart';

import 'package:json_widget_generator/src/model/base_model.dart';

abstract class BaseWidget extends StatelessWidget {
  EdgeInsets get margin;
  BaseModel get getDataModel;
  Map get getData;
  final Widget child;
  final GeneratorClickListener? clickListener;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        if (clickListener != null) {
          clickListener?.onClick(getData);
        }
      },
    );
  }

  BaseWidget.builder({required this.child, this.clickListener});
}
