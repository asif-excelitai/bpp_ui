import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khoroch/Screen/login/loginscreen.dart';
import 'package:khoroch/features/authentication/theme.controller/checkbox_provider.dart';
import 'package:khoroch/features/authentication/theme.controller/theme_provider.dart';
import 'package:khoroch/utils/theme/theme.dart';
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

  // @override
  // Widget build(BuildContext context) {}
  //     ChangeNotifierProvider(
  //   create: (context) {
  //   },
  //   builder: (context ,_){
  //     // final checkBoxProvider=Provider.of<CheckBoxProvider>(context);
  //     final themeProvider=Provider.of<ThemeProvider>(context);
  //     themeProvider.getInitialThemeMode();
  //     // final checkBoxProvider=Provider.of<CheckBoxProvider>(context);
  //     // checkBoxProvider.getInitialBoolmode();
  //
  //     // create: (context) {
  //     //   return ThemeProvider();
  //     // },
  //
  //
  //     return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       // themeMode: ThemeMode.system,
  //       locale: context.locale,
  //       localizationsDelegates: context.localizationDelegates,
  //       supportedLocales: context.supportedLocales,
  //       theme: SAppTheme.lighttheme,
  //       darkTheme: SAppTheme.darktheme,
  //       themeMode: themeProvider.themeMode,
  //       home:show? OnBoardingScreen() : const Mylogin() ,
  //     );
  //   },
  // );
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CheckBoxProvider()),
      ],
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        themeProvider.getInitialThemeMode();

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          theme: SAppTheme.lighttheme,
          darkTheme: SAppTheme.darktheme,
          themeMode: themeProvider.themeMode,
          home: show ? OnBoardingScreen() : const Mylogin(),
        );
      },
    );
  }
}


//
//
