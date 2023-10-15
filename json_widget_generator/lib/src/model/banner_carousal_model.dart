import 'package:json_widget_generator/src/model/base_model.dart';

class BannerCarousalModel extends BaseModel {
  final List<dynamic>? items;

  @override
  bool get isValidData => type != null && items != null && items!.length > 2;

  @override
  String get validationErrorMessage => isValidData ? "" : "Invalid data";

  BannerCarousalModel.fromMap(Map data)
      : items = data["items"],
        super(type: data["type"]);
}
