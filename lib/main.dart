import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'core/helper/cash_shared.dart';
import 'feature/auth/view/widget/custom_textField.dart';
import 'feature/cart/model/cart_service.dart';
import 'feature/fav/data/data.dart';
import 'my_app.dart';

void main() {
  print('---------------------------');
  //FavData.getAllFav(productId: '64666d3a91c71d884185b774');
  print('---------------------------');

  // CartService.getAllCart();
  WidgetsFlutterBinding.ensureInitialized();
  CashToken.init();
  CacheShared.init();
  runApp(
    DevicePreview(enabled: true, builder: (context) => const MyApp()),
  );
}
