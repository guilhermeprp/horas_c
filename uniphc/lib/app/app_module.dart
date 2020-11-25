import 'package:uniphc/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:uniphc/app/app_widget.dart';
import 'package:uniphc/app/modules/atividades/atividades_module.dart';
import 'package:uniphc/app/modules/estatisticas/estatisticas_module.dart';
import 'package:uniphc/app/modules/manuais/manuais_module.dart';
import 'package:uniphc/app/modules/splash/splash_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: SplashModule()),
        ModularRouter('/Home', module: HomeModule()),
        ModularRouter('/Atividades', module: AtividadesModule()),
        ModularRouter('/Estatisticas', module: EstatisticasModule()),
        ModularRouter('/Manuais', module: ManuaisModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
