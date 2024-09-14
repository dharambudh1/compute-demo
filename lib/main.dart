import "package:compute_demo/util/app_routes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Compute Demo",
      theme: getThemeData(brightness: Brightness.light),
      darkTheme: getThemeData(brightness: Brightness.dark),
      getPages: AppRoutes().getPages,
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData getThemeData({required Brightness brightness}) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorSchemeSeed: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      applyElevationOverlayColor: true,
    );
  }
}
