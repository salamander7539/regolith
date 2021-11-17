import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regolith/internal/locator.dart';
import 'app.dart';

void main() async {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Color for Android
      statusBarBrightness:
      Brightness.light // Dark == white status bar -- for IOS.
  ));

  setupLocator();

  runApp(const App());
}
