part of 'tabbar_bloc.dart';

@immutable
class TabbarState {
  final TabItem tab;
  TabbarState({required this.tab});

  TabbarState copyWith({TabItem? tab}){
    return TabbarState(tab: tab ?? this.tab);
  }
}
