import 'package:mobx/mobx.dart';

part 'estatisticas_controller.g.dart';

class EstatisticasController = _EstatisticasControllerBase
    with _$EstatisticasController;

abstract class _EstatisticasControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
