import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';

@RoutePage()
class AttendieTicketBuyingScreen extends StatelessWidget {
  const AttendieTicketBuyingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CommonAppBar());
  }
}
