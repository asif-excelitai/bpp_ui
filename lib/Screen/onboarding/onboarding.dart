import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khoroch/Screen/login/loginscreen.dart';
import 'package:khoroch/Screen/onboarding/widgets/onBoarding_page.dart';
import 'package:khoroch/utils/constant/colors.dart';
import 'package:khoroch/utils/constant/image_strings.dart';
import 'package:khoroch/utils/constant/sizes.dart';
import 'package:khoroch/utils/constant/text_strings.dart';
import 'package:khoroch/utils/device/device_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


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
            //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Mylogin()), (Route<dynamic>route) => false);
              Done(context);
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
          onLastpage ? Positioned(
        right: SSizes.defaultSpace,
        bottom: SDeviceUtlis.getBottomNavigationBarHeight(),
        child:
        ElevatedButton(
            onPressed: (){
              Done(context);
             // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Mylogin()), (Route<dynamic>route) => false);
            },
            style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor:SColors.primary),
            child:const Text("Done"),)
            ,)
              :
          Positioned(
              right: SSizes.defaultSpace,
              bottom: SDeviceUtlis.getBottomNavigationBarHeight(),
              child: ElevatedButton(
                onPressed: (){
                  _controller.nextPage(duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: SColors.primary),
                child:Icon(Iconsax.arrow_right_3),)),

        ],
      ),
    );
  }
}

void Done(context) async{
  final prefs= await SharedPreferences.getInstance();
  await prefs.setBool('OnBoardingScreen', false);
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=>const Mylogin()));
}
