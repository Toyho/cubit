import 'package:cubit/first_screen/first_screen.dart';
import 'package:cubit/second_screen/presenter/second_bloc.dart';
import 'package:cubit/second_screen/view/second_screen.dart';
import 'package:cubit/third_screen/view/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final SecondBloc _secondBloc = SecondBloc();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    var path = routeSettings.name!;

    switch (path) {
      case "/":
        {
          return MaterialPageRoute(
            builder: (_) => const FirstScreen(title: 'Flutter Demo Home Page'),
          );
        }
      case "/secondScreen":
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _secondBloc,
              child: const SecondScreen(),
            ),
          );
        }
      case "/thirdScreen":
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _secondBloc,
              child: const ThirdScreen(),
            ),
          );
        }
      default:
        return null;
    }
  }

  void disposeSecondBloc() {
    _secondBloc.close();
  }

}
