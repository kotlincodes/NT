import 'package:flutter/material.dart';
import 'package:json_widget_generator/src/common/base_widget.dart';
import 'package:json_widget_generator/src/model/banner_model.dart';
import 'package:json_widget_generator/src/model/base_model.dart';

class BannerWidget extends BaseWidget {
  final EdgeInsets margin;

  BannerWidget.build({
    required this.margin,
    required WidgetSettingBuilder widgetSettingBuilder,
  }) : super.builder(
            widgetSettings:
                WidgetSettings(widgetSettingBuilder: widgetSettingBuilder),
            child: _Banner(
              bannerModel: BannerModel.fromMap(widgetSettingBuilder.data),
              margin: margin,
            ));

  @override
  BaseModel get getDataModel => BannerModel.fromMap(widgetSettings.data);

  @override
  set margin(EdgeInsets margin) {
    margin;
  }
}

class _Banner extends StatelessWidget {
  final BannerModel bannerModel;
  final EdgeInsets margin;
  const _Banner({required this.bannerModel, required this.margin});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(bannerModel.padding ?? 12),
        margin: margin,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 4 / 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _HeadingWidget(headingText: bannerModel.headerText ?? ""),
            _FooterWidget(
              footerText: bannerModel.footerText ?? "",
              enableFooterIcon: bannerModel.footerIcon == true,
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(bannerModel.borderRadius ?? 26),
          color: bannerModel.colorValue,
          image: bannerModel.image != null
              ? DecorationImage(
                  image: NetworkImage(bannerModel.image!),
                  fit: BoxFit.fitWidth,
                )
              : null,
        ));
  }
}

class _HeadingWidget extends StatelessWidget {
  final String headingText;

  const _HeadingWidget({super.key, required this.headingText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        headingText,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(.2)),
    );
  }
}

class _FooterWidget extends StatelessWidget {
  final String footerText;
  final bool enableFooterIcon;

  const _FooterWidget(
      {super.key, required this.footerText, this.enableFooterIcon = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 36),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              footerText,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (enableFooterIcon) ...[
            SizedBox(
              width: 12,
            ),
            Icon(
              Icons.arrow_right_alt,
              size: 22,
            )
          ]
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(.2)),
    );
  }
}
