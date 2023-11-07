import 'package:flutter/material.dart';
import '../../utils/device/device_utility.dart';
class HeaderLogo extends StatelessWidget {
  const HeaderLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/logo/bppshop_banner.png",
      height: SDeviceUtlis.getScreenWidth(context)*.20,
      width: SDeviceUtlis.getScreenHeight(context)*.30,
      fit: BoxFit.contain,);
  }
}