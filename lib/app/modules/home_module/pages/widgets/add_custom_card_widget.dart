

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../generated/assets.dart';
import '../../../../domain/app/routes/app_routes.dart';

class AddCustomCardWidget extends StatelessWidget {
  const AddCustomCardWidget({
    super.key, required this.onTap,

  });
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
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

                Text("ADICIONAR NOVO PACIENTE",style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(
                  width: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
