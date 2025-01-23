import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/cart/cubit/cubit/cart_cubit.dart';
import 'package:flutter_application_2/feature/fav/cubit/cubit/fav_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/auth/view/screen/login_screen.dart';
import 'feature/fav/view/fav_screen.dart';
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CartCubit(),
              ),
              BlocProvider(
                create: (context) => FavCubit(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LoginScreen(),
            ),
          );
        });
  }
}
