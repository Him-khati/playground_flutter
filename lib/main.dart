import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_himanshu/home.dart';
import 'package:flutter_playground_himanshu/routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: AppRouter.goRouter,
      theme: FlexColorScheme.light(
        scheme: FlexScheme.blueM3
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
          scheme: FlexScheme.blueM3
      ).toTheme,
      themeMode: ThemeMode.system,
    );
  }
}