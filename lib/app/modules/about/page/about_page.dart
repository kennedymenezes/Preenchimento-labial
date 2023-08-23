import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/assets.dart';
import '../../../domain/app/routes/app_routes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  final about01 =
      'Cirurgiã Dentista pela Universidade de Fortaleza (UNIFOR). Mestranda pela Faculdade Paulo Picanço. Pós Graduanda em Harmonização Facial pela Faculdade Paulo Picanço. Residência em Harmonização Facial  pela Próspere Instituto Facial -São Paulo';
  final about02 =
      'Possui Graduação em Odontologia pela Universidade Federal do Ceará (2011), Mestrado em Cirurgia pela Universidade Federal do Ceará (2014), Residência em Cirurgia e Traumatologia Buco-Maxilo-Facial pelo Hospital Universitário João de Barros Barreto (2016). Doutor em Cirurgia pela Universidade Federal do Ceará (2018). Possui experiência em Cirurgia e Traumatologia Buco-Maxilo-Facial, com ênfase em CirurgiaOrtognática, Cirurgia dos Traumatismos Faciais,Patologias dos Maxilares, Cirurgia da Articulação Temporomandibular (ATM), Reconstrução Óssea dosMaxilares e Implantes Dentários. Atualmente, é professor da graduação e da pós-graduação da Faculdade Paulo Picanço (FACPP) e Cirurgião e Traumatologista Bucomaxilofacial do sobreaviso do Hospital São Mateus (Fortaleza-CE)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Sobre os autores",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Maria Vilma",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  about01,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('https://instagram.com/vilmacsobreira?igshid=MzRlODBiNWFlZA=='),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/instagram.png',
                          width: 40,
                          height: 40,
                        ),
                        const Text('Instagram')
                      ],
                    ),
                  ),
                ),
                const Text(
                  "Radamés Bezerra Melo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  about02,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('https://instagram.com/radamesbmelo?igshid=MzRlODBiNWFlZA=='),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/instagram.png',
                          width: 40,
                          height: 40,
                        ),
                        const Text('Instagram')
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.zero,
                    height: MediaQuery.of(context).size.width * 0.3,
                    child: ClipRect(
                      child: GestureDetector(
                        onTap: () {
                          Modular.to.pushReplacementNamed(AppRoutes.home);
                        },
                        child: Image.asset(
                          Assets.assetsBotaoEntrar,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
