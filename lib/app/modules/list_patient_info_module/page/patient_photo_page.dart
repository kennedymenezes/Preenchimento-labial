import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:labial/app/modules/list_patient_info_module/bloc/list_patient_info_bloc.dart';

import '../../../../generated/assets.dart';
import '../../../domain/app/widget/custom/cusom_button_ok_widget.dart';
import '../../../domain/app/widget/custom/custom_app_bar.dart';
import '../../sigup_model/SingupRoutes.dart';


class PatientPhotoPage extends StatelessWidget {
   PatientPhotoPage({Key? key, required this.userId, required this.title}) : super(key: key);
   final int userId;
   final String title;
  XFile? photo;
  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<ListPatientInfoBloc>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(size),
        body: Column(
          children: [
            SizedBox(height: size.width * 0.08),
            Center(
              child: Text(
                "FOTO PACIENTE",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: size.width * 0.08),
            Divider(
              height: 20,
              thickness: 1,
              indent: 30,
              endIndent: 30,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: size.width * 0.1),

            SizedBox(
              width: size.width * 0.9,
              child:InkWell(
                onTap: ()async{
                  final ImagePicker picker = ImagePicker();
                  photo = await picker.pickImage(source: ImageSource.camera);

                },
                child: Image.asset(
                  Assets.assetsBotaoAddImage,
                ),
              ),
            ),
            SizedBox(height: size.width * 0.1),
            CustomButtonOkWidget(
              onPressed: () {
                if (photo != null) {
                  Map<String,dynamic> data={'title':title,'path':photo!.path};
                  bloc.patientPhoto=photo!.path;
                  bloc.userId=userId;
                  Modular.to.pushNamed(".${SingupRoutes.okPhoto}",
                      arguments: data);
                }
              },
              title: "ENVIAR ARQUIVO",
              color: const Color(0xff7A7375),
            ),
            SizedBox(height: size.width * 0.2),
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
