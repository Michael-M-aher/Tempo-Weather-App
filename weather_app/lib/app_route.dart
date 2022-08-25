import 'package:flutter/material.dart';

import 'config/strings.dart';
import 'screens/main_screen.dart';
import 'screens/map_screen.dart';

class AppRouter {
  AppRouter();
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(
            builder: (_) => const MainScreen(selectedIndex: 0));
      case settingsScreen:
        return MaterialPageRoute(
            builder: (_) => const MainScreen(selectedIndex: 1));
      case mapScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      default:
        return null;
    }
  }
}
