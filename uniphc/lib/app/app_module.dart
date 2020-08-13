import 'package:uniphc/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:uniphc/app/app_widget.dart';
import 'package:uniphc/app/modules/atividades/atividades_module.dart';
import 'package:uniphc/app/modules/estatisticas/estatisticas_module.dart';
import 'package:uniphc/app/modules/splash/splash_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: SplashModule()),
        Router('/Home', module: HomeModule()),
        Router('/Atividades', module: AtividadesModule()),
        Router('/Estatisticas', module: EstatisticasModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
