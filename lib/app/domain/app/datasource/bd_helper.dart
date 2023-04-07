
import 'package:shared_preferences/shared_preferences.dart';

import '../util/bd_key_constraints.dart';

class BdHelper{


static Future<void> setData ({required BdKeyConstraints key,required String data})async{

  final SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString(key.toString(), data);

}
static Future<String?> getData ({required BdKeyConstraints key})async{

  final SharedPreferences prefs=await SharedPreferences.getInstance();
 return  prefs.getString(key.toString());

}

}