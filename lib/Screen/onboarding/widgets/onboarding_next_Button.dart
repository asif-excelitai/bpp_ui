// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../../../utils/constant/colors.dart';
// import '../../../../../utils/constant/sizes.dart';
// import '../../../../../utils/helpers/helper_function.dart';
// import '../../../features/authentication/Onboarding/onboarding_controller.dart';
// import '../../../utils/device/device_utility.dart';
// class onBoardingNextButton extends StatelessWidget {
//   const onBoardingNextButton({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final dark=SHelperFunctions.isDarkMode(context);
//     return Positioned(
//         right: SSizes.defaultSpace,
//         bottom: SDeviceUtlis.getBottomNavigationBarHeight(),
//         child: ElevatedButton(
//             onPressed: ()=>OnBoardingController.instance.nextPage(),
//             style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor:dark ? SColors.primary : Colors.black),
//             child: Icon(Iconsax.arrow_right_3)));
//   }
// }