import 'package:flutter/material.dart';

import '../widgets/languagelist.dart';

class Languagelist extends StatefulWidget {
  const Languagelist({super.key});

  @override
  State<Languagelist> createState() => _LanguagelistState();
}

class _LanguagelistState extends State<Languagelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
          title:const Text("Change Language ")),
      body:const  language(),
    );
  }
}
