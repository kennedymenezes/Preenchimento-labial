import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labial/app/domain/app/routes/app_routes.dart';
import 'package:labial/generated/assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: size.width * 0.2,
                  ),
                  Image.asset(
                    Assets.assetsLabio,
                    width: size.width * 0.2,
                  ),
                  Text(
                    "Preenchimento",
                    style: GoogleFonts.alumniSans(fontSize: 29, color: Colors.white),
                  ),
                  Image.asset(
                    Assets.assetsLabial,
                    width: size.width * 0.3,
                  ),
                  SizedBox(
                    height: size.width * 0.3,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    height: size.width * 0.3,
                    child: ClipRect(
                      child: GestureDetector(
                        onTap: () {
                          Modular.to.pushReplacementNamed(AppRoutes.about);
                        },
                        child: Image.asset(
                          Assets.assetsBotaoEntrar,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.25,
                  ),
                  Image.asset(
                    Assets.assetsLogoFacul,
                    width: size.width * 0.4,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
