import 'package:cubit/first_screen/first_screen.dart';
import 'package:cubit/second_screen/view/second_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    var path = routeSettings.name!;

    switch (path) {
      case "/":
        {
          return MaterialPageRoute(
            builder: (_) =>
                const FirstScreen(title: 'Flutter Demo Home Page'),
          );
        }
      case "/secondScreen":
        {
          return MaterialPageRoute(
            builder: (_) =>
                const SecondScreen(),
          );
        }
      default:
        return null;
    }
  }
}
