import 'package:craft_panel/screens/detail/components/configuration.dart';
import 'package:craft_panel/screens/detail/components/terminal.dart';
import 'package:flutter/material.dart';
import 'package:craft_panel/enums/detail_type.dart';
import 'package:mobx/mobx.dart';
part 'detail_store.g.dart';

class DetailStore = _DetailStoreBase with _$DetailStore;

abstract class _DetailStoreBase with Store {
  @observable
  var detailType = Observable(DetailType.TERMINAL);

  @action
  void toggle(DetailType detail) {
    detailType.value = detail;
  }

  @computed
  DetailType get seleted => detailType.value;

  Widget buildState() {
    switch (detailType.value) {
      case DetailType.TERMINAL:
        return Terminal();
      case DetailType.CONFIGURATION:
        return Configuration();
      default:
        return Container();
    }
  }
}
