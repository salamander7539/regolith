import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:regolith/presentation/pages/DashboardScreen/view/dashboard_screen.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final light = ThemeData.light();
    final dark = ThemeData.dark();

    return GetMaterialApp(
      title: 'Regolith',
      theme: light,
      darkTheme: dark,
      home: const DashboardScreen(),
    );
  }
}
