import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';
import 'package:mvvm_flutter_masterclass/data/model/device_info_model.dart';

Future<DeviceInfoModel> getDeviceDetails() async {
  String name = "";
  String identifier = "";
  String version = "";

  final deviceInfo = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      await deviceInfo.androidInfo.then((value) {
        name = value.brand.toString() + "" + value.model.toString();
        identifier = value.androidId.toString();
        version = value.version.codename.toString();
      });
    } else if (Platform.isIOS) {
      await deviceInfo.iosInfo.then((value) {
        name = value.name.toString() + "" + value.model.toString();
        identifier = value.identifierForVendor.toString();
        version = value.systemVersion.toString();
      });
    } else if (GetPlatform.isWeb) {
      await deviceInfo.webBrowserInfo.then((value) {
        name = value.browserName.toString();
        identifier = value.product.toString();
        version = value.appVersion.toString();
      });
    } else {}
  } on PlatformException {
    return DeviceInfoModel(
        name: name, identifier: identifier, version: version);
  }

  return DeviceInfoModel(name: name, identifier: identifier, version: version);
}
