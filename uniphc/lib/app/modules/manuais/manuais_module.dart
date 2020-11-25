import 'package:uniphc/app/modules/manuais/manuais_controller.dart';
import 'package:uniphc/app/modules/manuais/manuais_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ManuaisModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ManuaisController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ManuaisPage()),
      ];

  static Inject get to => Inject<ManuaisModule>.of();
}
