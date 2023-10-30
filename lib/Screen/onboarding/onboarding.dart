import 'package:ecshop/Screen/login/loginscreen.dart';
import 'package:ecshop/Screen/onboarding/widgets/onBoarding_page.dart';
import 'package:ecshop/utils/constant/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:path/path.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/constant/colors.dart';
import '../../utils/constant/sizes.dart';
import '../../utils/constant/text_strings.dart';
import '../../utils/device/device_utility.dart';
import '../../utils/helpers/helper_function.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller=PageController();
  bool onLastpage = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scrollable
          PageView(
            controller:_controller,

            // controller.pageController,
            onPageChanged: (index){
              setState(() {
                onLastpage=(index == 2);
              });
            },
            children: const [
              OnBoardingPage(
                  image: SImages.onBoardingImage1,
                  title: STexts.onBoardingTitle1,
                  subTitle: STexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: SImages.onBoardingImage2,
                  title: STexts.onBoardingTitle2,
                  subTitle: STexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: SImages.onBoardingImage3,
                  title: STexts.onBoardingTitle3,
                  subTitle: STexts.onBoardingSubTitle3),
            ],
          ),

          ///skip button
        Positioned(
            top: SDeviceUtlis.getAppBarHeight(),
            right: SSizes.defaultSpace,
            child: TextButton(onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Mylogin()), (Route<dynamic>route) => false);
            },
                child: const Text("skip")),),
          ///Dot Nav.. SmoothPageIndicator
          Positioned(
            bottom: SDeviceUtlis.getBottomNavigationBarHeight() + 25,
            left: SSizes.defaultSpace,
            child: SmoothPageIndicator(
              controller:_controller,
              count: 3,
            ),


          ),
          ///Circular button next
          onLastpage
       ? Positioned(
        right: SSizes.defaultSpace,
        bottom: SDeviceUtlis.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Mylogin()), (Route<dynamic>route) => false);
            },
            style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor:SColors.primary),
            child:const Text("Done"),)):
          Positioned(
              right: SSizes.defaultSpace,
              bottom: SDeviceUtlis.getBottomNavigationBarHeight(),
              child: ElevatedButton(
                onPressed: (){
                  _controller.nextPage(duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: SColors.primary),
                child:Icon(Iconsax.arrow_right_3),))
        ],
      ),
    );
  }
}
