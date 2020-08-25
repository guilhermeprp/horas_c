import 'estatisticas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'estatisticas_page.dart';

class EstatisticasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EstatisticasController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => EstatisticasPage()),
      ];

  static Inject get to => Inject<EstatisticasModule>.of();
}
