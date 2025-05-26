import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/application/pages/dashboard/dashboard_page.dart';
import 'package:todo_app/application/pages/overview/overview_page.dart';

class HomePage extends StatelessWidget {
  final int index;
  final String tab;
   HomePage({super.key,required  this.tab}): index = tabs.indexWhere((element)=>element.name== tab);
  static const tabs = [DashboardPage.pageconfig, OverviewPage.pageconfig];

  @override
  Widget build(BuildContext context) {
    final destinationList =
        tabs
            .map(
              (page) => NavigationDestination(
                icon: Icon(page.icon),
                label: page.name,
              ),
            )
            .toList();
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary-navigation-medium'),
                builder:
                    (context) => AdaptiveScaffold.standardNavigationRail(
                      onDestinationSelected: (index)=> _onTabNavigationDestination(context, index),
                      destinations: destinationList.map((element) => AdaptiveScaffold.toRailDestination(element)).toList()
                    ),
              ),
            },
          ),
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('bottom-navigation-small'),
                builder:
                    (context) => AdaptiveScaffold.standardBottomNavigationBar(
                      destinations: destinationList,
                      onDestinationSelected: (value)=>_onTabNavigationDestination(context, value)
                    ),
              ),
            },
          ),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body'),
                builder: (context) => HomePage.tabs[index].child,
              ),
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('secondary-body'),
                builder: AdaptiveScaffold.emptyBuilder,
              ),
            },
          ),
        ),
      ),
    );
  }
  void _onTabNavigationDestination(BuildContext context, int index)=>context.go('/home${HomePage.tabs[index].name}');
}
