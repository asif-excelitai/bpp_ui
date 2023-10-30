// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// class DropdownAreawordUnion extends StatefulWidget {
//   const DropdownAreawordUnion({super.key});
//
//   @override
//   State<DropdownAreawordUnion> createState() => _DropdownAreawordUnionState();
// }
//
// class _DropdownAreawordUnionState extends State<DropdownAreawordUnion> {
//   final List<String> itemsAwu = [
//     'Area 1',
//     'Area 2',
//     'Area 3',
//     'Area 4',
//   ];
//   String? selectedValueAwu;
//   bool selectItemerror=false;
//   String? itemErrorText;
//   String? _validateItem(value){
//     if(value!.isEmpty){
//       setState(() {
//         itemErrorText='Please Select ';
//         selectItemerror=true;
//       });
//       return'Please Select ';
//     }
//    setState(() {
//      itemErrorText='';
//      selectItemerror=false;
//    });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField2<String>(
//             isExpanded: true,
//             items: itemsAwu
//                 .map((String item) =>
//                 DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(
//                     item,
//                     style: const TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//
//                 ))
//                 .toList(),
//             // value: selectedValue,
//             // onChanged: (String? value) {
//             //   setState(() {
//             //     selectedValue = value;
//             //   });
//             // },
//               value: selectedValueAwu,
//               onChanged:(value){
//                 setState(() {
//                   selectItemerror=false;
//                   itemErrorText='';
//                 });
//                 _validateItem(value);
//               },
//             buttonStyleData: const ButtonStyleData(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               height: 40,
//               width: 225,
//             ),
//             menuItemStyleData: const MenuItemStyleData(
//               height: 40,
//             ),
//           //validator: (value) =>value == null ? 'Please Select Any':null,
//           //     onChanged:(value){
//           //     setState(() {
//           //       selectItemerror=false;
//           //       itemErrorText='';
//           //     });
//           //     _validateItem(value);
//           //     }
//           ),
//         ),
//       ),
//     );
//   }
// }
