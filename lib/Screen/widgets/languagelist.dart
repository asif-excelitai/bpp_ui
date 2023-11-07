import 'package:easy_localization/easy_localization.dart';
import 'package:ecshop/temp/temp.dart';
import 'package:ecshop/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';


class language extends StatelessWidget {
  const language({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              // ElevatedButton(
              //     onPressed: () {
              //       context.locale = Locale("bn");
              //     },
              //     child: Text(" Bangla")),
              TextButton(onPressed: (){context.locale =Locale("bn");SHelperFunctions.navigateToScreen(context, Userhomepage());}, child: Text(" Bangla")),
              const Icon(Icons.flag,color: Colors.green,)
            ],
          ),
          Row(
            children: [
              // ElevatedButton(
              //     onPressed: () {
              //       context.locale = Locale("en");
              //     },
              //     child: Text("English")
              // ),
              TextButton(onPressed: (){context.locale=Locale("en");SHelperFunctions.navigateToScreen(context, Userhomepage());}, child:const Text("English")),
              const Icon(Icons.flag,color: Colors.green,)
            ],
          ),
        ],
      ),
    );
  }
}