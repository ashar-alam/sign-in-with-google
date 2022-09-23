import 'package:flutter/material.dart';
import 'package:signin_with_google/Utils/routes.dart';

import '../screen/login_screen.dart';

class RoutesManager {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>const MyLoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text("No Route Found"),
              ),
            ),
          ),
        );
    }
  }
}
