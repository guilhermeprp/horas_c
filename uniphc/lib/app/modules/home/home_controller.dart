import 'package:mobx/mobx.dart';
import 'package:uniphc/app/modules/home/models/atividade_model.dart';
import 'package:uniphc/app/modules/home/repositories/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository _repository;
  
  _HomeControllerBase(this._repository){
    _repository.getAtividade().then((data) => listadeAtividades = data);
  }

  
  @observable
  List<AtividadeModel> listadeAtividades = [];


}
