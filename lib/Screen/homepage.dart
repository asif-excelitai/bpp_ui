import 'package:easy_localization/easy_localization.dart';
import 'package:ecshop/features/authentication/theme.controller/theme_provider.dart';
import 'package:ecshop/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Newone extends StatefulWidget {
  const Newone({super.key});

  @override
  State<Newone> createState() => _NewoneState();
}

class _NewoneState extends State<Newone> {
  bool darkvalue=false;
  bool lightvalue=false;
  bool systemvalue=false;
  @override
  Widget build(BuildContext context) {
    // final themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
        // backgroundColor: Colors.redAccent,
        body: Center(child: Text('Welcome to the Homepage '.tr().toString())),
        appBar: AppBar(),
        drawer:
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return Drawer(
            child: ListView(
              padding: const EdgeInsets.only(top: SSizes.defaultSpace),
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Text('Drawer Header'),
                ),
                // Switch.adaptive(
                //     value: themeProvider.isDarkMode,
                //
                //     onChanged:(value){
                //       if(value){
                //         themeProvider.setThemeMode(ThemeMode.dark);
                //       }else{
                //         themeProvider.setThemeMode(ThemeMode.light);
                //       }
                // }, ),
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
                            // if (value == ThemeMode.dark) {
                            //   themeProvider.setThemeMode(ThemeMode.dark);
                            // } else {
                            //   themeProvider.setThemeMode(ThemeMode.light);
                            // }
                            if( systemvalue=value!){
                              value=await themeProvider.setThemeMode(ThemeMode.system);
                              darkvalue=false;
                              lightvalue=false;
                            }
                            // value=themeProvider.setThemeMode(ThemeMode.system);
                            // systemvalue=value!;
                          },
                        ),
                        Text("System Mode"),
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
                          value:darkvalue,
                          onChanged: (value) async {
                            // if (value == ThemeMode.dark) {
                            //   themeProvider.setThemeMode(ThemeMode.dark);
                            // } else {
                            //   themeProvider.setThemeMode(ThemeMode.light);
                            // }
                            if(darkvalue=value!) {
                              value = await themeProvider.setThemeMode(ThemeMode.dark);
                              systemvalue=false;
                              lightvalue=false;

                              // darkvalue=value!;
                            }
                          },
                        ),
                        Text("Dark Mode"),
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
                                if(lightvalue=value!) {
                                  value =await themeProvider.setThemeMode(ThemeMode.light);
                                  systemvalue=false;
                                  darkvalue=false;
                                  // lightvalue=value!;
                                }
                             },

                        ),
                        Text("Light Mode"),
                      ],
                    ),


                    //rrrrrrrrrr


                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Checkbox(
                    //       shape: const RoundedRectangleBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(5.0))),
                    //       // Rounded Checkbox
                    //       value: themeProvider.isDarkMode,
                    //       onChanged: (value) {
                    //         if (value == ThemeMode.light) {
                    //           themeProvider.setThemeMode(ThemeMode.light);
                    //         } else {
                    //           themeProvider.setThemeMode(ThemeMode.dark);
                    //         }
                    //         // themeProvider.setThemeMode(ThemeMode.dark);
                    //       },
                    //     ),
                    //     Text("light Mode"),
                    //   ],
                    // ),
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Checkbox(
                    //       shape: const RoundedRectangleBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(5.0))),
                    //       // Rounded Checkbox
                    //       value: themeProvider.isDarkMode,
                    //       onChanged: (value) {
                    //         if (value == ThemeMode.system) {
                    //           themeProvider.setThemeMode(ThemeMode.system);
                    //         } else {
                    //           themeProvider.setThemeMode(ThemeMode.system);
                    //         }
                    //         // themeProvider.setThemeMode(ThemeMode.dark);
                    //       },
                    //     ),
                    //     Text("System"),
                    //   ],
                    // ),
                  ],
                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Language"),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.locale = Locale("bn");
                            },
                            child: Text(" Bangla")),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context.locale = Locale("en");
                            },
                            child: Text("English")),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        }));
  }
}
