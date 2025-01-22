import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/auth/view/screen/login_screen.dart';
import 'feature/product/view/screen/product_screen.dart';
import 'feature/profile/view/screen/profile_screen.dart';
import 'feature/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (_, child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ProductsScreen(),
          );
        });
  }
}
