import 'package:blinqpay/controllers/theme_ctr.dart';
import 'package:blinqpay/utils/theme_config.dart';
import 'package:blinqpay/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var themeCtr = Get.put(ThemeCtr());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'Blinq Pay',
        theme: ThemeConfig.lightTheme,
        darkTheme: ThemeConfig.darkTheme,
        themeMode: themeCtr.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const SplashScreens(),
      ),
    );
  }
}
