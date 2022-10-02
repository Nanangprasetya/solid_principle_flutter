part of 'main_cubit.dart';

class MainState extends Equatable {
  final MainTab tab;

  const MainState({this.tab = MainTab.article});

  @override
  List<Object> get props => [tab];
}
