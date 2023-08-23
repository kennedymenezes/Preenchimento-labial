import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/modules/home_module/bloc/home_state.dart';

import '../../../domain/app/routes/app_routes.dart';
import '../../../domain/app/widget/custom/custom_app_bar.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import 'widgets/add_custom_card_widget.dart';
import 'widgets/patiente_card_widget.dart';

class HomePage extends StatelessWidget {
  final HomeBloc bloc;

  const HomePage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context, bloc)),
    );
  }

  Widget _buildPage(BuildContext context, HomeBloc bloc) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: CustomAppBar(size),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeStateSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    AddCustomCardWidget(
                      onTap: () async {
                        await Modular.to.pushNamed(AppRoutes.singup);
                        bloc.add(HomeEventReload());
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: size.height * 0.7,
                      child: ListView.builder(
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PatientCardWidget(
                                pacient: state.data[index],
                                onTap: () async {
                                  await Modular.to.pushNamed(AppRoutes.listPatientInfo, arguments: state.data[index]);
                                  bloc.add(HomeEventReload());
                                },
                              ),
                            );
                          }),
                    )
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
