import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/modules/question_module/question_module.dart';
import 'package:labial/app/modules/sigup_model/singup_module.dart';
import 'package:labial/app/modules/singature_module/singature_module.dart';

import 'domain/app/routes/app_routes.dart';
import 'modules/about/about_module.dart';
import 'modules/home_module/home_module.dart';
import 'modules/list_patient_info_module/pdf_preview_module.dart';
import 'modules/pdf_preview/pdf_preview_module.dart';
import 'modules/splash_module/page/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SplashPage()),
        ModuleRoute(AppRoutes.home, module: HomeModule()),
        ModuleRoute(AppRoutes.singup, module: SingupModule()),
        ModuleRoute(AppRoutes.question, module: QuestionModule()),
        ModuleRoute(AppRoutes.pdfView, module: PdfPreviewModule()),
        ModuleRoute(AppRoutes.singature, module: SingatureModule()),
        ModuleRoute(AppRoutes.listPatientInfo, module: ListPatientInfoModule()),
        ModuleRoute(AppRoutes.about, module: AboutModule()),
      ];
}
