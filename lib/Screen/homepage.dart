import 'package:ecshop/provider_controller/app_theme_provider_or_controller.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      // Provider.of<AppThemeProvider>(context,listen: false).setThemeMode(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orangeAccent,
      appBar: AppBar(),
      drawer: Consumer<AppThemeProvider>(
        builder: (context,appThemeProvider,child) {
          return Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${appThemeProvider.isdarktheme}"),
                ListTile(
                  leading: Icon(Icons.mode_night_outlined),
                  title: Text("dark Mode"),
                  trailing: Switch(
                    // This bool value toggles the switch.
                    value: appThemeProvider.isdarktheme,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      WidgetsBinding.instance.addPostFrameCallback((_){
                        Provider.of<AppThemeProvider>(context,listen: false).setThemeMode(value);
                      });
                      setState(() {
                      });
                      // This is called when the user toggles the switch.

                    },
                  ),
                ),

              ],
            ),
          );
        }
      ),
      body: Container(
        child: Center(child: Text('Welcome to the Homepage ')),
      ),
    );
  }
}
