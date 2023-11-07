import 'package:flutter/material.dart';
import '../../common/login_signup/customeClippper.dart';
import '../../utils/helpers/helper_function.dart';


class ClipPathwidget extends StatelessWidget {
   const  ClipPathwidget({
    super.key,
    required this.dark,
  });

  final bool dark;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Traingle(),
      child: Container(
        color:dark?Color(0xff1a4c94): Color(0xffFEFEFE),
      ),
    );
  }
}