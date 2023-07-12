import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  dynamic routeTo(String route, {dynamic args}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: args);
  }

  dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}
