import 'package:flutter/material.dart';
import 'package:register_form/design/pages/main_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case MainPage.route:
        return MaterialPageRoute(builder: (_) => const MainPage());
      default:
        return MaterialPageRoute(builder: (_) => const MainPage());
    }
  }
}
