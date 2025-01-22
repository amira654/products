import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'feature/auth/model/data_auth/data_login.dart';
import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CashToken.init();
  runApp(
    DevicePreview(
      enabled: true, 
      builder: (context) => const MyApp()),
  );
}
