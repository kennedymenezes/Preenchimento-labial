

import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

AppBar CustomAppBar(Size size) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    centerTitle: true,
    title: Image.asset(
      Assets.assetsLogoAppbar,
      width: size.width * 0.3,
    ),
  );
}
