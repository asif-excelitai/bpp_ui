import 'package:ecshop/Screen/widgets/theme_list.dart';
import 'package:flutter/material.dart';
class ThemeSelect extends StatefulWidget {
  const ThemeSelect({super.key});

  @override
  State<ThemeSelect> createState() => _ThemeSelectState();
}

class _ThemeSelectState extends State<ThemeSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
          title:const Text("Change Theme")),
      body: const Themelist(),

    );
  }
}
