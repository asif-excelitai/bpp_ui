import 'package:easy_localization/easy_localization.dart';
import 'package:ecshop/Screen/login/loginscreen.dart';
import 'package:ecshop/features/authentication/theme.controller/theme_provider.dart';
import 'package:ecshop/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/onboarding/onboarding.dart';
bool show =true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final prefs= await SharedPreferences.getInstance();
  show = prefs.getBool('OnBoardingScreen') ?? true;
  runApp(
    EasyLocalization(child: Myapp(), supportedLocales: [
      Locale("en",""),
      Locale("bn",""),
    ],
        path: 'lib/features/language')
     // const Myapp()
  );
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: SAppTheme.lighttheme,
        darkTheme: SAppTheme.darktheme,
        themeMode: themeProvider.themeMode,
        home:show? OnBoardingScreen() : const Mylogin() ,
      );
    },
  );

}
