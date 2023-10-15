import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_widget_generator/json_widget_generator.dart';
import 'package:json_widget_generator/src/core/children/banner_widget.dart';
import 'package:json_widget_generator/src/core/children/horizontal_list.dart';
import 'package:json_widget_generator/src/core/children/invalid_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock_data/mock_data.dart';

void main() {
  group("Widget Generator Test", () {
    // Only valid banners
    testWidgets("Banner Widget", (widgetTester) async {
      var widgetGenerator = MaterialApp(
        home: WidgetGenerator.generate(json: jsonEncode(mockDataBanner)),
      );

      await mockNetworkImagesFor(
          () async => await widgetTester.pumpWidget(widgetGenerator));

      await widgetTester.pumpAndSettle();
      expect(find.byType(BannerWidget), findsNWidgets(2));
    });

// Invalid Json data - 1 proper banner && 1 invalid banner
// Expected result - 2 Banner widget - [If error Banner widget with Placeholder]
// Expected result - 1 Invalid Widget
    testWidgets("Banner Widget -Error Place Holder", (widgetTester) async {
      var widgetGenerator = MaterialApp(
        home: WidgetGenerator.generate(json: jsonEncode(mockDataBannerInvalid)),
      );

      await mockNetworkImagesFor(
          () async => await widgetTester.pumpWidget(widgetGenerator));

      await widgetTester.pumpAndSettle();
      expect(find.byType(BannerWidget), findsNWidgets(2));
      expect(find.byType(InvalidWidget), findsNWidgets(1));
    });

// 1 horizontal list
// with 1 box item and 2 circular item
// 1 circular item with invalid place holder
// `{
//   {
//     "type": "horizontal_list",
//     "title": "Collections",
//     "items": [
//       {
//         "type": "box_item",
//         "text": "Breakfast",
//         "image": "https://path/to/image.png"
//       },
//       {"type": "circular_item", "image": "https://path/to/image.png"},
//       {
//         "type": "circular_item",
//         "text": "Vegan",
//         "image": "https://path/to/image.png"
//       }
//     ]
//   },
// }`
    testWidgets("Horizontal List Widget-", (widgetTester) async {
      var widgetGenerator = MaterialApp(
        home:
            WidgetGenerator.generate(json: jsonEncode(mockDataHorizontalList)),
      );

      await mockNetworkImagesFor(
          () async => await widgetTester.pumpWidget(widgetGenerator));

      await widgetTester.pumpAndSettle();
      expect(find.byType(HorizontalList), findsOneWidget);
      expect(find.text("Breakfast"), findsOneWidget);
      expect(find.text("Vegan"), findsOneWidget);
      expect(find.byType(InvalidWidget), findsOneWidget);
    });
  });
}
