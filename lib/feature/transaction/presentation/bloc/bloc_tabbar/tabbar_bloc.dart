import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(TabbarState(tab: TabItem.home)) {
    on<TabChanged>((event, emit) {
      emit(state.copyWith(tab: event.tab));
    });
  }
}
