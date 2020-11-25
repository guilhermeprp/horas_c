import 'package:mobx/mobx.dart';

part 'manuais_controller.g.dart';

class ManuaisController = _ManuaisControllerBase with _$ManuaisController;

abstract class _ManuaisControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
