// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({required this.currentIndex});
  final int currentIndex;

  @override
  List<Object?> get props => [currentIndex];

  HomeState copyWith({int? currentIndex}) {
    return HomeState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
