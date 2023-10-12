library json_widget_generator;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_widget_generator/src/click_listener/generator_click_listener.dart';
import 'package:json_widget_generator/src/core/children/invalid_widget.dart';
import 'package:json_widget_generator/src/core/children/widget_builder_factory.dart';

// ignore: must_be_immutable
class WidgetGenerator extends StatelessWidget {
  final String json;
  final GeneratorClickListener? clickListener;

  /// Margin between widgets `EdgeInsets.only(bottom: 10)`
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return _buildWidget();
  }

  WidgetGenerator.build1(
      {required this.json,
      this.clickListener,
      this.margin = const EdgeInsets.only(bottom: 10)});

  Widget _buildWidget() {
    List<dynamic> jsonMap;
    try {
      jsonMap = jsonDecode(json)['widgets'];
    } on FormatException {
      return InvalidWidget();
    }
    return SingleChildScrollView(
      child: Column(
        children: WidgetBuilderFactory.buildWidgetList(jsonMap,
            clickListener: clickListener, margin: margin),
      ),
    );
  }
}
