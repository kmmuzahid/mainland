import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import '../widgets/sign_up_all_filed_widget.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.organizer, actions: const []),
      body: const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: SignUpAllField(),
      ),
    );
  }
}
