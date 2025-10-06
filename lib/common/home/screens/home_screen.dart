// File: home_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mainland/common/home/widgets/custom_bottom_navigation_bar.dart';

//  AutoRoute(page: HomeRoute.page),

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(child: Column(children: [
          
        ],
      )),
    bottomNavigationBar: CustomBottomNavigationBar(),
  );
}
