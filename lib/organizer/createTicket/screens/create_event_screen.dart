import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/organizer/createTicket/cubit/create_ticket_state.dart';

import '../cubit/create_ticket_cubit.dart';
import '../widgets/ticket_form_one.dart';
import '../widgets/ticket_form_three.dart';
import '../widgets/ticket_form_two.dart';

@RoutePage()
class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({Key? key, this.draftId}) : super(key: key);
  final String? draftId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = CreateTicketCubit();
        if (draftId != null) {
          cubit.fetchDraft(id: draftId!);
        }
        return cubit;
      },
      child: BlocBuilder<CreateTicketCubit, CreateTicketState>(
        builder: (context, state) {
          final bool isBackDisabled =
              (state.currentPage == 1 || (state.currentPage == 2 && !state.isExpandedView));
         
          return Scaffold(
            appBar: CommonAppBar( 
              disableBack: isBackDisabled,
              onBackPress: () {
                final cubit = context.read<CreateTicketCubit>();
                if (isBackDisabled) {
                  cubit.previousPage();
                }
              },
            ),
            body: state.isDraftFetching
                ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final firstForm = TicketFormOne(
                    createEventModel: state.draftEventModel,
                    isReadOnly: state.isReadOnly,
                    isExpanded: state.isExpandedView,
                    cubit: context.read(),
                  );
                  final secondForm = TicketFormTwo(
                    createEventModel: state.draftEventModel,
                    isReadOnly: state.isReadOnly,
                    isExpanded: state.isExpandedView,
                    cubit: context.read(),
                  );
                  final thirdForm = TicketFormThree(
                    createEventModel: state.draftEventModel,
                    isReadOnly: state.isReadOnly,
                    isExpanded: state.isExpandedView,
                    cubit: context.read(),
                  );

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Offstage(
                          offstage: !(state.currentPage == 0 || state.isExpandedView),
                          child: firstForm,
                        ),
                        Offstage(
                          offstage: !(state.currentPage == 1 || state.isExpandedView),
                          child: secondForm,
                        ),
                        Offstage(
                          offstage: !(state.currentPage == 2 || state.isExpandedView),
                          child: thirdForm,
                        ),
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
