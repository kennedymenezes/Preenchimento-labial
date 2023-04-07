
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../generated/assets.dart';
import '../../../../domain/app/model/patiente_model.dart';
import '../../../../domain/app/routes/app_routes.dart';

class PatientCardWidget extends StatelessWidget {
   const PatientCardWidget({
    super.key, required this.pacient,

  });
   final PatienteModel pacient;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Center(
      child: InkWell(
        onTap: (){
          Modular.to.pushNamed(AppRoutes.listPatientInfo,arguments: pacient);
        },
        child: Container(
          width: size.width * 0.9,
          height: size.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.3,
              style: BorderStyle.solid,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 1,
                ),
                Image.asset(
                  Assets.assetsIconFolder,
                  width: size.width * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Paciente",style: Theme.of(context).textTheme.labelMedium,),
                    Text(
                        pacient.nome!,
                        style: Theme.of(context).textTheme.labelSmall

                    ),
                  ],
                ),
                SizedBox(
                  width: size.width*0.2,
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
