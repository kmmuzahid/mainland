import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends SafeCubit<HomeState> {
  HomeCubit() : super(const HomeState(currentIndex: 0));

  void changeIndex(int index) => emit(state.copyWith(currentIndex: index));
}
