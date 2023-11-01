import 'package:ecshop/features/authentication/theme.controller/theme_provider.dart';
import 'package:ecshop/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screen/onboarding/onboarding.dart';
void main(){
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) =>ChangeNotifierProvider(
    create: (context)=>ThemeProvider(),
    builder: (context ,_){
      final themeProvider=Provider.of<ThemeProvider>(context);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.system,
        theme: SAppTheme.lighttheme,
        darkTheme: SAppTheme.darktheme,
        themeMode: themeProvider.themeMode,
        home:const OnBoardingScreen(),
      );
    },
  );

}
