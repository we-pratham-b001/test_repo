import 'package:flutter/material.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoutes) {
    debugPrint('didPop: ${route.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoutes) {
    debugPrint(
      'didPush: ${route.settings.name} Previous Route: ${previousRoutes?.settings.name}',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoutes) {
    debugPrint(
      'didRemove: ${route.settings.name} Previous Route: ${previousRoutes?.settings.name}',
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint(
      'didRemove: ${newRoute?.settings.name} Previous Route: ${oldRoute?.settings.name}',
    );
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    debugPrint(
      'didStartUserGesture: ${route.settings.name} Previous Route: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didStopUserGesture() {
    debugPrint('didStopUserGesture');
  }
}
