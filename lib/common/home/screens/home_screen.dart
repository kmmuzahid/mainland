// File: home_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

//  AutoRoute(page: HomeRoute.page),

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body:  Container(child: const Text('HomeScreen')));

}
