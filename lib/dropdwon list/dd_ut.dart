// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
//
// class DropdownUnionThana extends StatefulWidget {
//   const DropdownUnionThana({super.key});
//
//   @override
//   State<DropdownUnionThana> createState() => _DropdownUnionThanaState();
// }
//
// class _DropdownUnionThanaState extends State<DropdownUnionThana> {
//   final List<String> itemsUt = [
//     'Metro 1',
//     'Metro 2',
//     'Metro 3',
//     'Metro 4',
//   ];
//   String? selectedValueUt;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField2<String>(
//             isExpanded: true,
//             items: itemsUt
//                 .map((String item) =>
//                 DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(
//                     item,
//                     style: const TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//                 ))
//                 .toList(),
//             value: selectedValueUt,
//             onChanged: (String? value) {
//               setState(() {
//                 selectedValueUt = value;
//               });
//             },
//             buttonStyleData: const ButtonStyleData(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               height: 40,
//               width: 225,
//             ),
//             menuItemStyleData: const MenuItemStyleData(
//               height: 40,
//             ),
//           //  validator: (value) =>value == null ? 'Please Select Any':null,
//           ),
//         ),
//       ),
//     );
//   }
// }