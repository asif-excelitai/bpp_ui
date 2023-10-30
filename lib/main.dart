import 'package:ecshop/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'Screen/onboarding/onboarding.dart';
void main(){
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SAppTheme.lighttheme,
      darkTheme: SAppTheme.darkttheme,
      home:const OnBoardingScreen(),
    );
  }
}
