import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/organizer/createTicket/cubit/create_ticket_state.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';

import '../cubit/create_ticket_cubit.dart';
import '../widgets/ticket_form_one.dart';
import '../widgets/ticket_form_three.dart';
import '../widgets/ticket_form_two.dart';

@RoutePage()
class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTicketCubit(),
      child: BlocSelector<CreateTicketCubit, CreateTicketState, MapEntry<int, bool>>(
        selector: (state) => MapEntry(state.currentPage, state.isExpandedView),
        builder: (context, state) {
          return Scaffold(
            appBar: CommonAppBar(
              disableBack: state.key != 0,
              onBackPress: () {
                final cubit = context.read<CreateTicketCubit>();
                if (state.key == 1) {
                  cubit.previousPage();
                } else if (state.key == 2) {
                  cubit.toggleView();
                  cubit.previousPage();
                }
              },
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final firstForm = TicketFormOne(
                    createEventModel: CreateEventModel.empty(),
                    isReadOnly: false,
                    cubit: context.read(),
                  );
                  final secondForm = const TicketFormTwo();
                  final thirdForm = const TicketFormThree();

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Offstage(offstage: !(state.key == 0 || state.value), child: firstForm),
                        Offstage(offstage: !(state.key == 1 || state.value), child: secondForm),
                        Offstage(offstage: !(state.key == 2 || state.value), child: thirdForm),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
