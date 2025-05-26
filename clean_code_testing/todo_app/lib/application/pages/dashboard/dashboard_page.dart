import 'package:flutter/material.dart';
import '../../../core/page_config.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static const pageconfig = PageConfig(icon: Icons.dashboard, name: 'Overview');

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.teal);
  }
}
