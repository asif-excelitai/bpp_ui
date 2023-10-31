import 'package:ecshop/provider_controller/app_theme_provider_or_controller.dart';
import 'package:ecshop/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'Screen/onboarding/onboarding.dart';
import 'di_container.dart' as di;
void main()async{


  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => di.sl<AppThemeProvider>()),
          ],
          child: Myapp()
      )
  );
}
class Myapp extends StatelessWidget {
      Myapp({super.key});

  // ThemeData getAppTheme(){
  //
  //   // var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  //   // bool isDarkTheme = brightness == Brightness.dark;
  //   //
  //   // if(isDarkTheme){
  //   //   return SAppTheme.darkStheme;
  //   // }else{
  //   //   return SAppTheme.lighttheme;
  //   // }
  //
  // }

  @override
  Widget build(BuildContext context) {

    return  Consumer<AppThemeProvider>(
      builder: (context,appThemeProvider,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<AppThemeProvider>(context).getDefaultAppTheme(),
          // themeMode: ThemeMode.system,
          // theme: SAppTheme.lighttheme,
          // darkTheme: SAppTheme.darkStheme,
          home:const OnBoardingScreen(),
        );
      }
    );
  }
}
