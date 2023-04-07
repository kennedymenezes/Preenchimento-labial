import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/domain/app/routes/app_routes.dart';
import 'package:signature/signature.dart';

import '../../../../generated/assets.dart';
import '../../../domain/app/datasource/bd_helper.dart';
import '../../../domain/app/util/bd_key_constraints.dart';
import '../../../domain/app/widget/custom/cusom_button_ok_widget.dart';
import '../../../domain/app/widget/custom/custom_app_bar.dart';

class SingaturePage extends StatefulWidget {
  ///se for true muda a chave de salvar a assinatura


  const SingaturePage({super.key,});

  @override
  State<SingaturePage> createState() => _SingaturePageState();
}

final SignatureController _controller = SignatureController(
  penStrokeWidth: 1,
  penColor: Colors.black,
  exportBackgroundColor: Colors.white,
);

class _SingaturePageState extends State<SingaturePage> {
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  bool isMedico=true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(size),
      body: Column(
        children: [
          SizedBox(height: size.width * 0.08),
          Center(
            child: Text(
                isMedico
                    ? "ASSINATURA PROFFICIONAL"
                    : "ASSINATURA PACIENTE",
                style: Theme.of(context).textTheme.labelMedium),
          ),
          SizedBox(height: size.width * 0.08),
          Container(
            height: size.width * 0.45,
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: const Color(0xffEDE9E9),
                borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Signature(
                controller: _controller,
                backgroundColor: Colors.white,
                height: size.width * 0.45,
              ),
            ),
          ),
          SizedBox(height: size.width * 0.1),
          SizedBox(height: size.width * 0.1),
          CustomButtonOkWidget(
            onPressed: () async {
              _controller.clear();

            },
            title: "LIMPAR ASSINATURA",
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: size.width * 0.9,
            child: OutlinedButton(
              onPressed: () async{
                final imageData = await _controller.toPngBytes();
                var photoString=base64.encode(imageData!.toList());

                if(isMedico){
                  await BdHelper.setData(
                      data: photoString, key: BdKeyConstraints.medicalSingatue);
                  isMedico=false;
                  _controller.clear();
                  setState(() {

                  });

                }else{
                  await BdHelper.setData(
                      data: photoString, key: BdKeyConstraints.userSingature);
                  Modular.to.pushNamed(AppRoutes.pdfView);

                }
              },
              style: OutlinedButton.styleFrom(

                side: BorderSide(
                    width: 2.0, color: Theme.of(context).primaryColor),
              ),
              child: Text(
                'CONFIRMAR',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          SizedBox(height: size.width * 0.4),
          SizedBox(
            height: 80,
            child: Image.asset(
              Assets.assetsLogoFacul,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
