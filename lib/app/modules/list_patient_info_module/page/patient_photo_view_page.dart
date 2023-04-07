import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:labial/app/domain/app/routes/app_routes.dart';

import '../../../../generated/assets.dart';
import '../../../domain/app/widget/custom/cusom_button_ok_widget.dart';
import '../../../domain/app/widget/custom/custom_app_bar.dart';
import '../bloc/list_patient_info_bloc.dart';
import '../bloc/list_patient_info_event.dart';


class PatientPhotoViewPage extends StatelessWidget {
  PatientPhotoViewPage({Key? key, required this.imagePath, required this.title})
      : super(key: key);
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<ListPatientInfoBloc>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(size),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
                height: size.width * 0.45,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: const Color(0xffFEF6F8),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Center(child: Text(title),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        File(imagePath),
                        width: size.width*0.6,
                        height: size.width*0.35,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )),
            SizedBox(height: size.width * 0.3),
            CustomButtonOkWidget(
              onPressed: () {
                bloc.title=title;
                bloc.add(ListPatientInfoEventSendData());
              },
              title: "ENVIAR ARQUIVO",
              color: const Color(0xff7A7375),
            ),
            SizedBox(height: size.width * 0.2),
            SizedBox(width: size.width),
            SizedBox(
              height: 80,
              child: Image.asset(
                Assets.assetsLogoFacul,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ));
  }
}
