import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/theme_config.dart';

class ThemeCtr extends GetxController {
  // RxBool to observe theme changes
  final _isDarkMode = false.obs;

  // Getter to determine if dark mode is enabled
  bool get isDarkMode => _isDarkMode.value;

  // Get the current theme data based on the theme mode
  ThemeData get themeData =>
      _isDarkMode.value ? ThemeConfig.darkTheme : ThemeConfig.lightTheme;

  // Switch between light and dark themes
  void switchTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeTheme(
        _isDarkMode.value ? ThemeConfig.darkTheme : ThemeConfig.lightTheme);
  }
}
