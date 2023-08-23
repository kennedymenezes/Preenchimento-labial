import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/modules/about/page/about_page.dart';

class AboutModule extends Module {
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AboutPage()),
      ];
}
