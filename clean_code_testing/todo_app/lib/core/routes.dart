import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/application/pages/home/home_page.dart';
import 'package:todo_app/core/router_observer.dart';

final GlobalKey<NavigatorState> _global_navigator_key =
  GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shell_navigator_key =
  GlobalKey<NavigatorState>(debugLabel: 'shell');

final routes = GoRouter(
  observers: [GoRouterObserver()],
  initialLocation: '/home/start',
  navigatorKey: _global_navigator_key,
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomePage(tab: '',);
      },
    ),

    ShellRoute(
      navigatorKey: _shell_navigator_key,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          path: '/home:tab',
          builder: (context, state) => HomePage(key: state.pageKey,tab:state.pathParameters['tab']??'dashboard'),
        ),
      ],
    ),
  ],
);
