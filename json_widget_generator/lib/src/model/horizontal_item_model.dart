import 'package:json_widget_generator/src/model/base_model.dart';

class HorizontalListModel extends BaseModel {
  final List<dynamic>? items;
  final String? title;
  @override
  bool get isValidData =>
      items != null && items?.isNotEmpty == true && title != null;

  @override
  String get validationErrorMessage => isValidData ? "" : "Invalid list items";

  HorizontalListModel.fromMap(Map data)
      : items = data["items"],
        title = data["title"],
        super(type: data["type"]);
}

class HorizontalItemModel extends BaseModel {
  final String? text;
  final String? image;
  @override
  bool get isValidData => type != null && image != null && text != null;

  @override
  String get validationErrorMessage => isValidData ? "" : "Invalid Item Data";

  HorizontalItemModel.fromMap(Map data)
      : image = data["image"],
        text = data["text"],
        super(type: data["type"]);
}
