import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:meta/meta.dart';

part 'venue_state.dart';

class VenueCubit extends SafeCubit<VenueState> {
  VenueCubit() : super(const VenueState(currentIndex: 0));

  void changeIndex(int index) => emit(state.copyWith(currentIndex: index));
}
