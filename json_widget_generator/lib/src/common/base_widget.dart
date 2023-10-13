import 'package:flutter/material.dart';
import 'package:json_widget_generator/src/core/children/invalid_widget.dart';

import 'package:json_widget_generator/src/model/base_model.dart';

abstract class BaseWidget extends StatelessWidget {
  final WidgetSettings widgetSettings;
  void set margin(EdgeInsets margin);
  BaseModel get getDataModel;
  Map get getData;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: getDataModel.isValidData
          ? child
          : InvalidWidget(
              text: getDataModel.validationErrorMessage,
            ),
      onTap: () {
        if (widgetSettings.clickListener != null) {
          widgetSettings.clickListener?.onClick(getData);
        }
      },
    );
  }

  BaseWidget.builder({required this.child, required this.widgetSettings});
}
