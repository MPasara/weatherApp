// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:package_info_plus/src/package_info_plus_web.dart';
import 'package:sensors_plus_web/sensors_plus_web.dart';
import 'package:sentry_flutter/sentry_flutter_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  PackageInfoPlusWebPlugin.registerWith(registrar);
  SensorsPlugin.registerWith(registrar);
  SentryFlutterWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
