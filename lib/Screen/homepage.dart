import 'package:ecshop/features/authentication/theme.controller/theme_provider.dart';
import 'package:ecshop/utils/constant/sizes.dart';
import 'package:ecshop/utils/theme/theme.dart';
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
      body: Container(
        child: Center(child: Text('Welcome to the Homepage ')),
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title:const Text('This is home page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: SSizes.defaultSpace),
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
            } )
          ],
        ),
      )
    );
  }
}
