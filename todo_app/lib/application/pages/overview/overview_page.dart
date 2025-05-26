import 'package:flutter/material.dart';
import 'package:todo_app/core/page_config.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});
  static const pageconfig = PageConfig(icon: Icons.work, name: 'Overview');
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}
