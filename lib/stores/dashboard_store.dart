import 'package:craft_panel/enums/screen_type.dart';
import 'package:craft_panel/screens/detail/detail_screen.dart';
import 'package:craft_panel/screens/list/list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStoreBase with _$DashboardStore;

abstract class _DashboardStoreBase with Store {
  @observable
  var screenType = Observable(ScreenType.LIST_SERVERS);

  @computed
  ScreenType get getScreenType => screenType.value;

  @action
  void toggle(ScreenType type) {
    screenType.value = type;
  }

  Widget build(double width) {
    switch (screenType.value) {
      case ScreenType.LIST_SERVERS:
        return ListScreen(width: width);
      case ScreenType.DETAIL_SERVER:
        return DetailScreen(width: width);
      default:
        return Container();
    }
  }

  @observable
  var serverName = Observable('');

  @action
  void setServerName(String serverName) {
    this.serverName.value = serverName;
  }

  @computed
  String get name => serverName.value;
}
