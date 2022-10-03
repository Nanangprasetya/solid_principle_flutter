import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());

  void setTab(int tab) {
    switch (tab) {
      case 2:
        emit(MainState(tab: MainTab.users));
        break;
      case 1:
        emit(MainState(tab: MainTab.photos));
        break;
      default:
        emit(MainState(tab: MainTab.article));
    }
  }
}
