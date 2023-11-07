
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/authentication/theme.controller/theme_provider.dart';
import '../../utils/constant/sizes.dart';


class themelist extends StatelessWidget {
  const themelist({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    bool darkvalue = false;
    bool lightvalue = false;
    bool systemvalue = false;
    return Scaffold(
        body: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return ListView(
            padding: const EdgeInsets.only(top: SSizes.defaultSpace),
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0))),
                        // Rounded Checkbox
                        // value: themeProvider.isDarkMode,
                        value: systemvalue,
                        onChanged: (value) async {
                          if (systemvalue = value!) {
                            value = await themeProvider.setThemeMode(ThemeMode.system);
                            lightvalue = false;
                            darkvalue=false;
                          }
                        },
                      ),
                     const Text("System Mode"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0))),
                        // Rounded Checkbox
                        // value: themeProvider.isDarkMode,
                        value: lightvalue,
                        onChanged: (value) async {
                          if (lightvalue = value!) {
                            value = await themeProvider.setThemeMode(ThemeMode.light);
                            systemvalue = false;
                            darkvalue = false;
                          }
                        },

                      ),
                      Text("Light Mode"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
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

