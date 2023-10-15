import 'dart:ui';

import 'package:json_widget_generator/src/model/base_model.dart';

class BannerModel extends BaseModel {
  final String? image;
  final String? headerText;
  final String? color;
  final String? footerText;
  final bool? footerIcon;
  final double? borderRadius;
  final double? padding;
  BannerModel.fromMap(Map<dynamic, dynamic> data)
      : headerText = data["header_text"],
        footerText = data["footer_text"],
        image = data["image"],
        color = data["color"],
        footerIcon = data["footer_icon"],
        borderRadius = double.tryParse(data["border_radius"]?.toString() ?? ""),
        padding = double.tryParse(data["padding"]?.toString() ?? ""),
        super(type: data["type"]);

  Color? get colorValue =>
      color != null ? Color(int.parse("0xff$color")) : null;

  @override
  bool get isValidData =>
      (image != null || color != null) &&
      footerText != null &&
      headerText != null;

  @override
  String get validationErrorMessage =>
      isValidData ? '' : 'Required params missing';
}
