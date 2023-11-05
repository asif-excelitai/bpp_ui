import 'package:easy_localization/easy_localization.dart';
import 'package:ecshop/features/authentication/theme.controller/theme_provider.dart';
import 'package:ecshop/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screen/onboarding/onboarding.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
        home:const OnBoardingScreen(),
      );
    },
  );

}
