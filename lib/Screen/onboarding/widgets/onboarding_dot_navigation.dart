// import 'package:ecshop/utils/device/device_utility.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../../../../../utils/constant/colors.dart';
// import '../../../../../utils/constant/sizes.dart';
// import '../../../../../utils/helpers/helper_function.dart';
// import '../../../features/authentication/Onboarding/onboarding_controller.dart';
//
// class onBoardingDotNavigation extends StatelessWidget {
//   const onBoardingDotNavigation({
//     super.key,
//   });
//
//
//   @override
//   Widget build(BuildContext context) {
//     PageController _controller=PageController();
//     final dark=SHelperFunctions.isDarkMode(context);
//     return Positioned(
//       bottom: SDeviceUtlis.getBottomNavigationBarHeight() + 25,
//       left: SSizes.defaultSpace,
//       child: SmoothPageIndicator(
//         controller:_controller.pageController,
//         count: 3,onDotClicked: _controller,
//         effect: ExpandingDotsEffect(
//             activeDotColor:dark ? SColors.light : SColors.dark,dotHeight: 6 ),
//       ),
//
//
//     );
//   }
// }