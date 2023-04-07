import 'package:flutter_modular/flutter_modular.dart';

import 'pdf_preview.dart';

class PdfPreviewModule extends Module {
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const PdfPreviewPage(

                )),
      ];
}
