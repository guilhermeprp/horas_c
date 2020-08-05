import 'package:hasura_connect/hasura_connect.dart';
import 'package:uniphc/app/modules/atividades/repositories/atividades_repository.dart';
import 'package:uniphc/app/modules/atividades/widgets/card_atividade/card_atividade_controller.dart';
import 'package:uniphc/app/modules/atividades/atividades_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uniphc/app/modules/atividades/atividades_page.dart';

class AtividadesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controller
        Bind((i) => CardAtividadeController()),
        Bind((i) => AtividadesController(i.get<AtividadesRepository>())),

        // Repositories
        Bind((i) => AtividadesRepository(i.get<HasuraConnect>())),
        
        // Hasura
        Bind((i) => HasuraConnect("https://uniphc.herokuapp.com/v1/graphql")),
      ];
  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AtividadesPage()),
      ];

  static Inject get to => Inject<AtividadesModule>.of();
}
