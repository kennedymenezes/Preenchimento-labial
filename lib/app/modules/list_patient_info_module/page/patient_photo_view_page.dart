import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/domain/app/datasource/patiente_datasource_Impl.dart';

import '../../../../generated/assets.dart';
import '../../../domain/app/datasource/patient_datasource.dart';
import '../../../domain/app/model/patiente_model.dart';
import '../../../domain/app/routes/app_routes.dart';
import '../../../domain/app/widget/custom/cusom_button_ok_widget.dart';
import '../../../domain/app/widget/custom/custom_app_bar.dart';
import '../bloc/list_patient_info_bloc.dart';
import '../bloc/list_patient_info_event.dart';


class PatientPhotoViewPage extends StatefulWidget {
  const PatientPhotoViewPage({Key? key, required this.imagePath, required this.title, required this.userId})
      : super(key: key);
  final String imagePath;
  final String title;
  final int userId;

  @override
  State<PatientPhotoViewPage> createState() => _PatientPhotoViewPageState();
}


class _PatientPhotoViewPageState extends State<PatientPhotoViewPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

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
                    Center(child: Text(widget.title),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        File(widget.imagePath),
                        width: size.width*0.6,
                        height: size.width*0.35,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )),
            SizedBox(height: size.width * 0.3),
            CustomButtonOkWidget(
              onPressed: ()async {
               var patientDatasource= PatientDataSourceImpl();
                var tratamento=Tratamento(image:widget.imagePath,title:widget.title );
                await patientDatasource.update(id: widget.userId, tratamento: tratamento);
               Modular.to.popAndPushNamed(AppRoutes.home);


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
