import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'core/helper/cash_shared.dart';
import 'feature/auth/view/widget/custom_textField.dart';
import 'feature/cart/model/cart_service.dart';
import 'my_app.dart';

void main() {
  // print('---------------------------');
  // CartService.getAllCart();
  WidgetsFlutterBinding.ensureInitialized();
 // CashToken.init();
  CacheShared.init();
  runApp(
    DevicePreview(
      enabled: true, 
      builder: (context) => const MyApp()),
  );
}
