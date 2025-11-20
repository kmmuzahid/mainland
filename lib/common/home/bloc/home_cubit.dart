import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/widgets/terms_and_conditions.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends SafeCubit<HomeState> {
  HomeCubit() : super(const HomeState(currentIndex: 0)); 

  void changeIndex(int index) => emit(state.copyWith(currentIndex: index));

  void init() {}

}
