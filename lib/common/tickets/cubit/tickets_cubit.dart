import 'package:mainland/common/tickets/cubit/tickets_state.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/gen/assets.gen.dart';

class TicketsCubit extends SafeCubit<TicketsState> {
  TicketsCubit() : super(const TicketsState());

  void initalize(TicketFilter filter) {
    emit(state.copyWith(selectedFilter: filter));
    fetch();
  }

  void fetch() {
    emit(
      state.copyWith(
        tickets: [
          for (int i = 0; i < 20; i++)
            TicketModel(
              title: '''
            Juice WRLD
Mon. Jan. 12, 8pm
Eko Hotel & Suites
Pre Order available
Nov. 1 $i''',
              isAvailable: i % 2 == 0,
              image: Assets.images.sampleItem.path,
              eventId: 'event_id_$i',
            ),
        ],
      ),
    );
  }

  void filter(TicketFilter filter) {
    emit(state.copyWith(selectedFilter: filter));
  }
}
