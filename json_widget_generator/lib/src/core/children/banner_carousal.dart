import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:json_widget_generator/src/common/base_widget.dart';
import 'package:json_widget_generator/src/core/children/banner_widget.dart';
import 'package:json_widget_generator/src/model/banner_carousal_model.dart';
import 'package:json_widget_generator/src/model/base_model.dart';

class BannerCarousal extends BaseWidget {
  BannerCarousal.build({required WidgetSettingBuilder widgetSettingBuilder})
      : super.builder(
          widgetSettings:
              WidgetSettings(widgetSettingBuilder: widgetSettingBuilder),
          child: CarouselSlider(
            items: BannerCarousalModel.fromMap(widgetSettingBuilder.data)
                .items
                ?.map((e) {
              WidgetSettingBuilder widgetSettingBuilderItem =
                  WidgetSettingBuilder()
                    ..data = e
                    ..clickListener = widgetSettingBuilder.clickListener;
              return BannerWidget.build(
                  margin: EdgeInsets.all(12),
                  widgetSettingBuilder: widgetSettingBuilderItem);
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
        );

  @override
  set margin(EdgeInsets margin) {}

  @override
  BaseModel get getDataModel =>
      BannerCarousalModel.fromMap(widgetSettings.data);
}
