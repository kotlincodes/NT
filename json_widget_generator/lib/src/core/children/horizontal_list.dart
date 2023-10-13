import 'package:flutter/material.dart';
import 'package:json_widget_generator/src/common/base_widget.dart';
import 'package:json_widget_generator/src/model/base_model.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [for (int i = 0; i < 100; i++) HorizontalItem.builder()],
      ),
    );
  }
}

class HorizontalItem extends BaseWidget {
  HorizontalItem.builder()
      : super.builder(
            child: Container(
          margin: EdgeInsets.only(right: 2),
          width: 60,
          height: 60,
          color: Colors.amber,
        ));

  @override
  Map get getData => throw UnimplementedError();

  BaseModel get getDataModel => throw UnimplementedError();

  @override
  // TODO: implement margin
  EdgeInsets get margin => throw UnimplementedError();
}
