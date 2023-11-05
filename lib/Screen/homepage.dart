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
  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: Colors.redAccent,
      body: Center(child: Text('Welcome to the Homepage '.tr().toString())),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // title:const Text('This is home page'),
      ),
      drawer: Drawer(
        // backgroundColor: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: const EdgeInsets.only(top: SSizes.defaultSpace),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
              ),
              child: Text('Drawer Header'),
            ),
            Switch.adaptive(
                value: themeProvider.isDarkMode,
                onChanged:(value){
               final provider=Provider.of<ThemeProvider>(context ,listen:false );
               provider.toggleTheme(value);
            } ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Language"),
                Spacer(flex: 2,),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.locale = Locale("bn");
                        },
                        child: Text(" Bangla")),
                    SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.locale = Locale("en");
                        }, child: Text("English")),
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
