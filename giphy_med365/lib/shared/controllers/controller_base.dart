import 'package:mobx/mobx.dart';

part 'controller_base.g.dart';

class ControllerBase = _ControllerBase with _$ControllerBase;

abstract class _ControllerBase with Store {

  @observable
  bool isBusy = false;
}
