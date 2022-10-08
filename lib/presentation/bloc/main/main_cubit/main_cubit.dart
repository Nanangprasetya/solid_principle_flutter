import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());

  void setTab(int tab) {
    switch (tab) {
      case 2:
        emit(state.copyWith(tab: MainTab.users));
        break;
      case 1:
        emit(state.copyWith(tab: MainTab.photos));
        break;
      default:
        emit(state.copyWith(tab: MainTab.article));
    }
  }

  void setDrawer(bool isDrawer) => emit(state.copyWith(isDrawer: !isDrawer));
}
