import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mainland/common/setting/cubit/faq_cubit.dart';
import 'package:mainland/common/setting/model/faq_model.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/other_widgets/smart_list_loader.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/bloc/cubit_scope.dart';

@RoutePage()
class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'FAQ/Help'),
      body: CubitScope(
        create: () => FaqCubit()..fetch(),
        builder: (context, cubit, state) {
          return SmartListLoader(
            isLoading: state.isLoading,
            onRefresh: () {
              cubit.fetch(isRefresh: true);
            },
            onLoadMore: cubit.fetch,
            itemCount: state.faq.length,
            itemBuilder: (context, index) {
              final faq = state.faq[index];
              return _faqBuilder(faq);
            },
          );
        },
      ),
    );
  }

  Widget _faqBuilder(FaqModel faq) {
    return Column(
      children: [
        CommonText(text: faq.question),
        CommonText(text: faq.answer),
      ],
    );
  }
}
