part of 'tabbar_bloc.dart';

enum TabItem {home , profile}
@immutable
sealed class TabbarEvent {}

class TabChanged extends TabbarEvent{
  final TabItem tab;
  TabChanged(this.tab);
}
