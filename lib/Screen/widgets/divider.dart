import 'package:flutter/material.dart';

import '../../utils/device/device_utility.dart';

class gDivider extends StatelessWidget {
  const gDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black,
      height: SDeviceUtlis.getScreenHeight(context)*.001,
      thickness:SDeviceUtlis.getScreenHeight(context)*.001,
    );
  }
}