
import 'package:flutter/material.dart';

class CustomButtonOkWidget extends StatelessWidget {
  const CustomButtonOkWidget({
    super.key, required this.onPressed, required this.title, required this.color,
  });
  final  VoidCallback onPressed;
  final  String title;
  final  Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.9,
      height: size.width * 0.13,
      child: InkWell(
          onTap:onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white
                  ),
                )),
          )),
    );
  }
}
