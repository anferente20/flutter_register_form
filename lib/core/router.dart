import 'package:flutter/material.dart';
import 'package:register_form/design/pages/main_page.dart';
import 'package:register_form/design/screens/user_information_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainPage.route:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case UserInformation.route:
        final arguments = settings.arguments! as UserInformationArgs;
        return MaterialPageRoute(
            builder: (_) => UserInformation(user: arguments.user));

      default:
        return MaterialPageRoute(builder: (_) => const MainPage());
    }
  }
}
