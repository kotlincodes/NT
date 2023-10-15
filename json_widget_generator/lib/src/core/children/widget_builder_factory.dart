import 'package:flutter/material.dart';
import 'package:json_widget_generator/src/click_listener/generator_click_listener.dart';
import 'package:json_widget_generator/src/core/children/banner_carousal.dart';
import 'package:json_widget_generator/src/core/children/banner_widget.dart';
import 'package:json_widget_generator/src/core/children/horizontal_list.dart';
import 'package:json_widget_generator/src/model/base_model.dart';

class WidgetBuilderFactory {
  static List<Widget> buildWidgetList(List<dynamic> jsonList,
      {GeneratorClickListener? clickListener, required margin}) {
    List<Widget> list = [];
    for (var item in jsonList) {
      if (item is Map) {
        var widgetSettingBuilder = WidgetSettingBuilder()
          ..clickListener = clickListener
          ..data = item;

        if (item["type"] == SupportedWidgetTypes.banner.name) {
          list.add(BannerWidget.build(
            widgetSettingBuilder: widgetSettingBuilder,
            margin: margin,
          ));
        }

        if (item["type"] == SupportedWidgetTypes.horizontal_list.name) {
          list.add(HorizontalList(
            widgetSettingBuilder: widgetSettingBuilder,
          ));
        }

        if (item["type"] == SupportedWidgetTypes.banner_carousal.name) {
          list.add(
              BannerCarousal.build(widgetSettingBuilder: widgetSettingBuilder));
        }
        list.add(SizedBox(
          height: 36,
        ));
      }
    }
    return list;
  }
}

enum SupportedWidgetTypes {
  banner("banner"),
  horizontal_list("horizontal_list"),
  banner_carousal("banner_carousal");

  const SupportedWidgetTypes(this.name);
  final String name;
}
