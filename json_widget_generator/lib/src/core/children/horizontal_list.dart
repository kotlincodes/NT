import 'package:flutter/material.dart';
import 'package:json_widget_generator/src/common/base_widget.dart';
import 'package:json_widget_generator/src/core/children/invalid_widget.dart';
import 'package:json_widget_generator/src/model/base_model.dart';
import 'package:json_widget_generator/src/model/horizontal_item_model.dart';

class HorizontalList extends StatelessWidget {
  final WidgetSettingBuilder widgetSettingBuilder;

  const HorizontalList({super.key, required this.widgetSettingBuilder});
  @override
  Widget build(BuildContext context) {
    HorizontalListModel horizontalListModel =
        HorizontalListModel.fromMap(widgetSettingBuilder.data);
    return horizontalListModel.isValidData
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(horizontalListModel.title!),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: horizontalListModel.items!.map((e) {
                    WidgetSettings widgetSettings = WidgetSettings(
                        widgetSettingBuilder: widgetSettingBuilder..data = e);

                    return _HorizontalItem.build(
                        widgetSettings: widgetSettings);
                  }).toList(),
                ),
              ),
            ],
          )
        : InvalidWidget(
            text: horizontalListModel.validationErrorMessage,
          );
  }
}

class _HorizontalItem extends BaseWidget {
  _HorizontalItem.build({
    required super.widgetSettings,
  }) : super.builder(
            child: widgetSettings.data["type"] == "circular_item"
                ? _CircularItem(data: widgetSettings.data)
                : _BoxItem(data: widgetSettings.data));

  BaseModel get getDataModel =>
      HorizontalItemModel.fromMap(widgetSettings.data);

  @override
  set margin(EdgeInsets margin) {
    EdgeInsets.all(10);
  }
}

class _CircularItem extends StatelessWidget {
  final HorizontalItemModel itemModel;

  _CircularItem({super.key, required Map data})
      : itemModel = HorizontalItemModel.fromMap(data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      width: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.list_alt,
                  size: 60,
                ),
              ),
              shape: CircleBorder(),
            ),
          ),
          Text(
            itemModel.text!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

class _BoxItem extends StatelessWidget {
  final HorizontalItemModel itemModel;

  _BoxItem({super.key, required Map data})
      : itemModel = HorizontalItemModel.fromMap(data);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 12, left: 12),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.list_alt,
                size: 60,
              ),
            ),
            Text(
              itemModel.text!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
