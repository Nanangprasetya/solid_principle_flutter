part of 'main_cubit.dart';

class MainState extends Equatable {
  final MainTab tab;
  final bool isDrawer;

  const MainState({this.tab = MainTab.article, this.isDrawer = true});

  MainState copyWith({
    MainTab? tab,
    bool? isDrawer,
  }) {
    return MainState(
      tab: tab ?? this.tab,
      isDrawer: isDrawer ?? this.isDrawer,
    );
  }

  @override
  List<Object> get props => [tab, isDrawer];
}
