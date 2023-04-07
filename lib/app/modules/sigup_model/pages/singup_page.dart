import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/modules/home_module/bloc/home_state.dart';
import 'package:labial/app/modules/sigup_model/bloc/singup_state.dart';
import 'package:labial/generated/assets.dart';

import '../../../domain/app/datasource/bd_helper.dart';
import '../../../domain/app/util/bd_key_constraints.dart';
import '../../../domain/app/widget/custom/cusom_button_ok_widget.dart';
import '../../../domain/app/widget/custom/custom_app_bar.dart';
import '../SingupRoutes.dart';
import '../bloc/singup_bloc.dart';
import '../bloc/singup_event.dart';

class SigupPage extends StatelessWidget {
  final SingupBloc bloc;

  const SigupPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<SingupBloc>(context);
    final size = MediaQuery.of(context).size;
    final userNameController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(size),
        body: BlocBuilder<SingupBloc, SingupState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: size.width * 0.08),
                Center(
                  child: Text(
                    "CADASTRAR PACIENTE",
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
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.4),
                  child: Text("NOME DA PACIENTE",
                      style: Theme.of(context).textTheme.labelMedium),
                ),
                SizedBox(
                  width: size.width * 0.9,
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: 'digite aqui...',
                      icon: Icon(Icons.person,
                          color: Theme.of(context).primaryColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Theme.of(context).primaryColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.width * 0.1),
                CustomButtonOkWidget(
                  onPressed: () async {
                    await BdHelper.setData(
                        data: userNameController.text, key: BdKeyConstraints.userName);
                    bloc.patientName=userNameController.text;
                    Modular.to.pushNamed(".${SingupRoutes.addPhoto}");
                  },
                  title: "OK",
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: size.width * 0.6),
                SizedBox(
                  height: 80,
                  child: Image.asset(
                    Assets.assetsLogoFacul,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            );
          },
        ));
  }
}
