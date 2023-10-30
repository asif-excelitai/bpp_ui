// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// class Dropdowndistrictcity extends StatefulWidget {
//   const Dropdowndistrictcity({super.key});
//
//   @override
//   State<Dropdowndistrictcity> createState() => _DropdowndistrictcityState();
// }
//
// class _DropdowndistrictcityState extends State<Dropdowndistrictcity> {
//   final List<String> itemsDc = [
//     'Dhaka',
//     'Khulna',
//     'Rajshahi',
//     'Chittagram',
//   ];
//   String? selectedValueDc;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField2<String>(
//             isExpanded: true,
//             items: itemsDc
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
//             value: selectedValueDc,
//             onChanged: (String? value) {
//               setState(() {
//                 selectedValueDc = value;
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
//            //validator: (value) =>value == null ? 'Please Select Any':null,
//           ),
//         ),
//       ),
//     );
//   }
// }