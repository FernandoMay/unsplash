import 'package:flutter/cupertino.dart';
import 'package:unsplash/view/home.dart';
import 'package:unsplash/view/splash.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case "/splash":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const Splash(),
      );
    case "/home":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const Home(),
      );

    default:
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => CupertinoPageScaffold(
          child: Center(
            child: Text('404! No available! :(',
                style: CupertinoTheme.of(_).textTheme.textStyle),
          ),
        ),
      );
  }
}
