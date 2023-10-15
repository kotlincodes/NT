import 'package:json_widget_generator/json_widget_generator.dart';

abstract class BaseModel {
  final String? type;
  BaseModel({required this.type});
  bool get isValidData;

  String get validationErrorMessage;
}

class WidgetSettings {
  final GeneratorClickListener? clickListener;
  final Map data;
  WidgetSettings({required WidgetSettingBuilder widgetSettingBuilder})
      : clickListener = widgetSettingBuilder.clickListener,
        data = widgetSettingBuilder.data;
}

class WidgetSettingBuilder {
  GeneratorClickListener? clickListener;
  late Map data;
}
