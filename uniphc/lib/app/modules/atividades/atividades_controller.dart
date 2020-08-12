import 'package:mobx/mobx.dart';
import 'package:uniphc/app/modules/atividades/models/atividades_model.dart';
import 'package:uniphc/app/modules/atividades/repositories/atividades_repository.dart';

part 'atividades_controller.g.dart';

class AtividadesController = _AtividadesControllerBase with _$AtividadesController;

abstract class _AtividadesControllerBase with Store {
  final AtividadesRepository _repository;
  
  _AtividadesControllerBase(this._repository){
    _repository.getAtividade().then((data) => listadeAtividades = data);
  }

  
  @observable
  List<AtividadeModel> listadeAtividades = [];

}
