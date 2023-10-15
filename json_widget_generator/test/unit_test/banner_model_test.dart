import 'package:flutter_test/flutter_test.dart';
import 'package:json_widget_generator/src/model/banner_model.dart';

import '../mock_data/mock_data.dart';

void main() {
  test("Banner Model Test - Valid Data", () {
    BannerModel bannerModel =
        BannerModel.fromMap(mockDataBanner["widgets"]![0]);

    // valid data only if `(image != null || color != null) &&
    // footerText != null &&
    // headerText != nul;`
    expect(bannerModel.isValidData, true);
    // Check error message is correct or not
    expect(bannerModel.validationErrorMessage, '');

    expect(bannerModel.image != null || bannerModel.color != null, true);
    expect(bannerModel.footerText != null, true);
    expect(bannerModel.headerText != null, true);
  });

  test("Banner Model Test - Invalid Data", () {
    BannerModel bannerModel =
        BannerModel.fromMap(mockDataBannerInvalid["widgets"]![0]);

    // valid data only if `(image != null || color != null) &&
    // footerText != null &&
    // headerText != nul;`
    expect(bannerModel.isValidData, false);

    //Error message should not be empty
    expect(bannerModel.validationErrorMessage.isNotEmpty, true);
    expect(bannerModel.validationErrorMessage, "Required params missing");

    //Check if isValid function is proper
    expect(
        (bannerModel.image != null || bannerModel.color != null) &&
            bannerModel.footerText != null &&
            bannerModel.headerText != null,
        false);
  });

  test("Banner Model is A type of BaseModel", () {
    var bannerModel = BannerModel.fromMap(mockDataBannerInvalid["widgets"]![0]);

    // ignore: unnecessary_type_check
    expect((bannerModel is BannerModel), true);
  });

  /// Note Todo
  /// Can write validation rule test for all widgets --
  ///
  ///
}
