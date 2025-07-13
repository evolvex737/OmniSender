import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:omni_sender/infrastructure/main.infrastructure.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: evolvexDarkTheme,
      themeMode: ThemeMode.system, // atau ThemeMode.dark
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: evolvexTheme,
    );
  }
}
