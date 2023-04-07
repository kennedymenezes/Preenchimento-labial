import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labial/app/domain/app/model/patiente_model.dart';
import 'package:labial/app/modules/list_patient_info_module/bloc/list_patient_info_state.dart';

import '../../../../generated/assets.dart';
import '../../../domain/app/widget/custom/custom_app_bar.dart';
import '../../home_module/pages/widgets/add_custom_card_widget.dart';
import '../bloc/list_patient_info_bloc.dart';
import '../bloc/list_patient_info_event.dart';


class ListPatientInfoPage extends StatelessWidget {
  const ListPatientInfoPage(
      {super.key, required this.bloc, required this.patiente});

  final ListPatientInfoBloc bloc;
  final PatienteModel patiente;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<ListPatientInfoBloc>(context);
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: CustomAppBar(size),
      body: BlocBuilder<ListPatientInfoBloc, ListPatientInfoState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: size.width * 0.08),
              Center(
                child: Text(
                  patiente.nome!,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Theme
                      .of(context)
                      .primaryColor),
                ),
              ),
              SizedBox(height: size.width * 0.08),
              Divider(
                height: 20,
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              SizedBox(height: size.width * 0.1),

              ViewPatientPhoto(title: 'Pós-operatória imediata',
                image: patiente.tratamento![0].image!,
                sub: "",),
              SizedBox(height: size.width * 0.1),

              patiente.tratamento!.length == 2 ? ViewPatientPhoto(
                title: 'TRATAMENTO',
                image: patiente.tratamento![0].image!,
                sub: "1 MÊS",):
              const AddUser(title: 'FOTO 1 MÊS',),
              SizedBox(height: size.width * 0.1),

              patiente.tratamento!.length == 3 ? ViewPatientPhoto(
                title: 'TRATAMENTO',
                image: patiente.tratamento![0].image!,
                sub: "6 MÊS",):
              const AddUser(title: 'FOTO 6 MÊS',),
              SizedBox(height: size.width * 0.2),
              SizedBox(
                height: 80,
                child: Image.asset(
                  Assets.assetsLogoFacul,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
              )
            ],
          );
        },),
    );
  }
}

class ViewPatientPhoto extends StatelessWidget {
  const ViewPatientPhoto(
      {Key? key, required this.title, required this.image, required this.sub})
      : super(key: key);
  final String title;
  final String image;
  final String sub;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Column(children: [
      Container(
        width: size.width * 0.9,
        height: size.width * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.3,
            style: BorderStyle.solid,
            color: Theme
                .of(context)
                .primaryColor
                .withOpacity(0.6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 1,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(image),
                  width: size.width * 0.12,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sub.isNotEmpty ? Text(sub, style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,) :
                  SizedBox(),
                  Text(
                      title,
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelSmall

                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.2,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
        ),
      )
    ],);
  }
}


class AddUser extends StatelessWidget {
  const AddUser({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Container(
      width: size.width * 0.9,
      height: size.width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.3,
          style: BorderStyle.solid,
          color: const Color(0xff837B7D).withOpacity(0.6),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(
              Assets.assetsIconAdd,
              width: size.width * 0.1,

            ),

            Text(title, style: Theme
                .of(context)
                .textTheme
                .labelMedium),
            const SizedBox(
              width: 1,
            ),
          ],
        ),
      ),
    );
  }
}
