import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/app_module.dart';
import 'package:labial/app/app_widget.dart';
import 'package:labial/app/domain/app/util/bd_key_constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref=await SharedPreferences.getInstance();
  await pref.remove(BdKeyConstraints.userName.toString());
  await pref.remove(BdKeyConstraints.userSingature.toString());
  await pref.remove(BdKeyConstraints.medicalSingatue.toString());
  await pref.remove(BdKeyConstraints.userName.toString());


  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}


