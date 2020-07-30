import 'package:hasura_connect/hasura_connect.dart';
import 'package:uniphc/app/modules/home/repositories/home_repository.dart';
import 'package:uniphc/app/modules/home/widgets/card_atividade/card_atividade_controller.dart';
import 'package:uniphc/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uniphc/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controller
        Bind((i) => CardAtividadeController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),

        // Repositories
        Bind((i) => HomeRepository(i.get<HasuraConnect>())),
        
        // Hasura
        Bind((i) => HasuraConnect("https://uniphc.herokuapp.com/v1/graphql")),
      ];
  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
