import 'package:flutter/material.dart';
import 'package:json_widget_generator/src/click_listener/generator_click_listener.dart';
import 'package:json_widget_generator/src/core/children/banner_widget.dart';

class WidgetBuilderFactory {
  static List<Widget> buildWidgetList(List<dynamic> jsonList,
      {GeneratorClickListener? clickListener, required margin}) {
    List<Widget> list = [];
    for (var item in jsonList) {
      if (item is Map) {
        if (item["type"] == SupportedWidgetTypes.banner.name) {
          list.add(BannerWidget.build(
            data: item,
            margin: margin,
          ));
        }
      }
    }
    return list;
  }
}

enum SupportedWidgetTypes {
  banner("banner");

  const SupportedWidgetTypes(this.name);
  final String name;
}
