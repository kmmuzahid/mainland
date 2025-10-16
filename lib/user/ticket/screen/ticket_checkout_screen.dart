import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';

enum TicketCheckoutType { organizer, attendee }

@RoutePage()
class TicketCheckoutScreen extends StatelessWidget {
  const TicketCheckoutScreen({super.key, required this.type});

  final TicketCheckoutType type;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CommonAppBar());
  }
}
