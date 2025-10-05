import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';

@RoutePage()
class ShowInfoScreen extends StatelessWidget {
  const ShowInfoScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: title),
      body: const Center(child: Text('Show Info')),
    );
  }
}
