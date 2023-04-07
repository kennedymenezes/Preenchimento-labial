

import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/modules/singature_module/page/singature_page.dart';

class SingatureModule extends Module {
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
        child: (context, args) => const SingaturePage(

        )),
  ];
}
