import 'dart:ui';

import 'package:json_widget_generator/src/model/base_model.dart';

class BannerModel extends BaseModel {
  String? image;
  String? headerText;
  String? color;
  String? footerText;
  bool? footerIcon;
  double? borderRadius;
  double? padding;
  BannerModel.fromMap(Map<dynamic, dynamic> data) : super(type: data["type"]) {
    image = data["image"];
    headerText = data["header_text"];
    color = data["color"];
    footerText = data["footer_text"];
    footerIcon = data["footer_icon"];
    borderRadius = double.tryParse(data["border_radius"].toString() ?? "");
    padding = data["padding"];
  }

  Color? get colorValue =>
      color != null ? Color(int.parse("0xff$color")) : null;

  @override
  bool get isValidData => image != null || color != null;

  @override
  Map get toMap => {
        "image": image,
        "header_text": headerText,
        "color": color,
        "footer_text": footerText,
        "footer_icon": footerIcon,
        "border_radius": borderRadius,
        "padding": padding
      };
}
