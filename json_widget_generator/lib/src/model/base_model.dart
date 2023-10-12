abstract class BaseModel {
  final String type;

  BaseModel({required this.type});

  bool get isValidData;
  Map get toMap;
}
