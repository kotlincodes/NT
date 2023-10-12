import 'package:flutter/material.dart';
import 'package:json_widget_generator/src/click_listener/generator_click_listener.dart';
import 'package:json_widget_generator/src/common/base_widget.dart';
import 'package:json_widget_generator/src/core/children/invalid_widget.dart';
import 'package:json_widget_generator/src/core/children/widget_builder_factory.dart';
import 'package:json_widget_generator/src/model/banner_model.dart';
import 'package:json_widget_generator/src/model/base_model.dart';

class BannerWidget extends BaseWidget {
  final GeneratorClickListener? clickListener;
  final Map data;
  final EdgeInsets margin;

  BannerWidget.build({
    required this.margin,
    this.clickListener,
    required this.data,
  }) : super.builder(
            child: _Banner(
          bannerModel: BannerModel.fromMap(data),
          margin: margin,
        ));

  @override
  Map get getData => getDataModel.toMap;

  @override
  BaseModel get getDataModel => BannerModel.fromMap(data);
}

class _Banner extends StatelessWidget {
  final BannerModel bannerModel;
  final EdgeInsets margin;
  const _Banner({required this.bannerModel, required this.margin});
  @override
  Widget build(BuildContext context) {
    return bannerModel.isValidData
        ? Container(
            margin: margin,
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: bannerModel.colorValue,
              image: bannerModel.image != null
                  ? DecorationImage(
                      image: NetworkImage(bannerModel.image!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ))
        : InvalidWidget();
  }
}
