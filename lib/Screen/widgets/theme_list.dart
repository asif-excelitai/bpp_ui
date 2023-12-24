
import 'package:ecshop/features/authentication/checkbox.controller/checkbox_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/authentication/theme.controller/theme_provider.dart';
import '../../temp/temp.dart';
import '../../utils/constant/sizes.dart';
import '../../utils/helpers/helper_function.dart';


class Themelist extends StatelessWidget {
  const Themelist({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    bool darkvalue = false;
    bool lightvalue = false;
    bool systemvalue = false;
    return Scaffold(
        body:
        Consumer2<ThemeProvider,CheckBoxProvider>(builder: (context, themeProvider,checkBoxProvider ,child) {
          return ListView(
            padding: const EdgeInsets.only(top: SSizes.defaultSpace),
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0))),
                        value: systemvalue,
                        onChanged: (value) async {
                          if (systemvalue = value!) {
                            value = await themeProvider.setThemeMode(ThemeMode.system);
                            lightvalue = false;
                            darkvalue=false;
                            value =await checkBoxProvider.setBoolmode(true);
                            // SHelperFunctions.navigateToScreen(context, Userhomepage());
                          }
                        },
                      ),
                      const Text("System Mode"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0))),
                        value: lightvalue,
                        onChanged: (value) async {
                          if (lightvalue = value!) {
                            value = await themeProvider.setThemeMode(ThemeMode.light);
                            systemvalue = false;
                            darkvalue = false;
                            value =await checkBoxProvider.setBoolmode(true);
                            // SHelperFunctions.navigateToScreen(context, Userhomepage());
                          }
                        },

                      ),
                      Text("Light Mode"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0))),
                        // Rounded Checkbox
                        // value: themeProvider.isDarkMode,
                        value: darkvalue,
                        onChanged: (value) async {
                          if (darkvalue = value!) {
                            value =
                            await themeProvider.setThemeMode(ThemeMode.dark);
                            systemvalue = false;
                            lightvalue = false;
                            value =await checkBoxProvider.setBoolmode(true);
                            // SHelperFunctions.navigateToScreen(context, Userhomepage());
                          }
                        },
                      ),
                      Text("Dark Mode"),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
        )
    );
  }
}

