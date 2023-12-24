import 'package:easy_localization/easy_localization.dart';
import 'package:ecshop/Screen/signup/registration.dart';
import 'package:ecshop/temp/temp.dart';
import 'package:ecshop/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import '../../utils/helpers/helper_function.dart';
import '../HomePage/homepage.dart';
import '../widgets/clipPath.dart';
import '../widgets/divider.dart';
import '../widgets/headerlogo.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}
class _MyloginState extends State<Mylogin> {
  // void _submitForm1(){
  //   if(_formKey1.currentState!.validate()){
  //     {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => Newone()));
  //
  //     }
  //   }
  // }
  final _formKey1 = GlobalKey<FormState>();
  bool isMobileNoError=false;
  String? mobileErrorText;
  bool isPasswordError=false;
  String? passwordErrorText;
  bool isChecked = false;
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();
  String? _validatePhoneNumber(value) {
    if (value!.isEmpty) {
      setState(() {
        isMobileNoError = true;
        mobileErrorText = 'Please Enter a Valid number';
      });
      return 'Please Enter a Valid number';
    }
    RegExp phonregex = RegExp(r'^(01|\+880)\d{9,12}$');
    if (!phonregex.hasMatch(value)) {
      setState(() {
        isMobileNoError = true;
        mobileErrorText = 'Enter Correct Phone number';
      });
      return 'Enter Correct Phone number';
    }
    else {
      setState(() {
        isMobileNoError = false;
        mobileErrorText = '';
      });
    }
    return null;
  }
  String? _validatePassword(value){
    if(value!.isEmpty){
      setState(() {
        isPasswordError=true;
        passwordErrorText='Enter valid password';
      });
      return 'Enter valid password';
    }
  //   RegExp passregexp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
  // if(!passregexp.hasMatch(value)){
  //   return 'Enter your Password';
  // }
  else if(value.length!<8){
    setState(() {
      isPasswordError=true;
      passwordErrorText='More than 8 Character';
    });
    return 'More than 8 Character';
  }

  else{
      setState(() {
        isPasswordError=false;
        passwordErrorText='';
      });
    }
  return null;

  }
  @override
  void dispose() {
       _passWordController.dispose();
        _phoneNumberController.dispose();
        super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return GestureDetector(
       onTap: (){
         FocusScopeNode currentFocus=FocusScope.of(context);
         if(!currentFocus.hasPrimaryFocus){
           currentFocus.unfocus();
         }
       },
      child: SafeArea(
        child: Scaffold(
           resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xffF3F3F3),
          body: SingleChildScrollView(
            child: Container(
              height: SDeviceUtlis.getScreenHeight(context) ,
              width: SDeviceUtlis.getScreenWidth(context) ,
              child: Center(
                child: Stack(
                  children: [
                    ClipPathwidget(dark: dark),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: SDeviceUtlis.getScreenHeight(context)*.015,),
                        const  HeaderLogo(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal:SDeviceUtlis.getScreenWidth(context) * .010),
                          margin: EdgeInsets.symmetric(horizontal: SDeviceUtlis.getScreenWidth(context)*.030),
                          width: SDeviceUtlis.getScreenWidth(context),
                          height: SDeviceUtlis.getScreenHeight(context) * .5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Color(0xFFFFFFFF)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Sign in".tr().toString(),
                                style: TextStyle(
                                    fontSize: SDeviceUtlis.getScreenHeight(context)*.025,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff334257)),
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.001,
                              ),
                              Text(
                                "Welcome to seller Login".tr().toString(),
                                style: TextStyle(fontSize: SDeviceUtlis.getScreenHeight(context)*.020,color: Color(0xff667180)),
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.010,
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: SDeviceUtlis.getScreenWidth(context)*.008, right:SDeviceUtlis.getScreenWidth(context)*.008),
                                child:const gDivider(),
                              ),
                              SizedBox(
                                height:SDeviceUtlis.getScreenHeight(context)*.005,
                              ),
                              SingleChildScrollView(
                                child: Form(
                                  key: _formKey1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: SDeviceUtlis.getScreenWidth(context)*.02),
                                        child: Text(
                                          "Mobile".tr().toString(),
                                          style: TextStyle(
                                            fontSize: SDeviceUtlis.getScreenHeight(context)*.017,
                                            color: Color(0xff334257),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: SDeviceUtlis.getScreenHeight(context) *.06,
                                        width: SDeviceUtlis.getScreenWidth(context) * .6,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isMobileNoError?Colors.red:Colors.blue,
                                          ),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          controller: _phoneNumberController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(14),
                                            ),
                                            hintText: "Enter mobile Number".tr().toString(),
                                          ),
                                          onChanged: (value){
                                           _validatePhoneNumber(value);
                                          },
                                        ),
                                      ),
                                      isMobileNoError?Text("${mobileErrorText}",style: TextStyle(color: Colors.redAccent),):SizedBox.shrink(),
                                     // SizedBox(height: 10,),
                                      Padding(
                                        padding: EdgeInsets.only(left:SDeviceUtlis.getScreenWidth(context)*.02),
                                        child: Text(
                                          "Password".tr().toString(),
                                          style: TextStyle(
                                            fontSize: SDeviceUtlis.getScreenHeight(context)*.017,
                                            color: Color(0xff334257),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: SDeviceUtlis.getScreenHeight(context) * .06,
                                        width: SDeviceUtlis.getScreenWidth(context) * .6,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isPasswordError?Colors.red : Colors.blue,
                                          ),borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          obscureText: true,
                                          controller: _passWordController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(14),
                                            ),
                                            hintText: "Enter Password".tr().toString(),
                                          ),
                                          // validator: _validatePassword,
                                          onChanged: (value){
                                            // setState(() {
                                            //   // isPasswordError=false;
                                            //   // passwordErrorText='';
                                            //
                                            // });
                                            _validatePassword(value);
                                          },
                                        ),
                                      ),
                                      isPasswordError?Text("${passwordErrorText}",style: TextStyle(color: Colors.redAccent),):SizedBox.shrink(),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                         Row(
                                           children: [
                                             Checkbox(
                                               value: isChecked,
                                               onChanged: (bool? value) {
                                                 setState(() {
                                                   isChecked = value!;
                                                 });
                                               },
                                             ),
                                             Text("Remember me".tr().toString(), style: TextStyle(color:Color(0xffB2B2B2),fontSize: SDeviceUtlis.getScreenHeight(context)*.016),),
                                           ],
                                         ),
                                          TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        child: AlertDialog(
                                                            title: Text(
                                                                "Enter Phone number"),
                                                            content: TextFormField(
                                                              keyboardType: TextInputType.number,
                                                              // autovalidateMode: AutovalidateMode.onUserInteraction,
                                                              controller: _phoneNumberController,
                                                              decoration: InputDecoration(
                                                                filled: true,
                                                                border: OutlineInputBorder(
                                                                  borderSide: BorderSide.none,
                                                                  borderRadius: BorderRadius.circular(10),
                                                                ),
                                                                hintText: "Enter mobile Number".tr().toString(),
                                                              ),
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      "ok"))
                                                            ]),
                                                      );
                                                    });
                                              },
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  "Forget Password ?".tr().toString(),
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,fontSize: SDeviceUtlis.getScreenHeight(context)*.016
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.060,
                                width: SDeviceUtlis.getScreenWidth(context),
                                child: ElevatedButton(
                                    onPressed: (){
                                      if(_phoneNumberController.text.isNotEmpty && _passWordController.text.isNotEmpty ){
                                        setState(() {
                                          isMobileNoError=false;
                                          mobileErrorText='';
                                          isPasswordError=false;
                                          passwordErrorText='';
                                        });
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Newone()),)
                                        SHelperFunctions.navigateToScreen(context,const Userhomepage());
                                      }else{
                                        if(_phoneNumberController.text.isEmpty){
                                          setState(() {
                                            isMobileNoError=true;
                                            mobileErrorText='Enter valid Mobile No';
                                          });
                                        }
                                        if(_passWordController.text.isEmpty){
                                          setState(() {
                                            isPasswordError=true;
                                            passwordErrorText='Enter valid password';
                                          });
                                        }
                                      }
                                    },
                                  child: Text("Sign in".tr().toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: SDeviceUtlis.getScreenWidth(context) * .025,
                                    ),)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Become a seller".tr().toString(),
                                    style: TextStyle(color: Color(0xff667180),
                                    fontSize: SDeviceUtlis.getScreenHeight(context)*.015),),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Registration()),
                                        );
                                      },
                                      child: Text(
                                        "Signup",
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: SDeviceUtlis.getScreenHeight(context)*.016,fontWeight: FontWeight.bold,
                                          // decoration: TextDecoration.underline,),
                                      )))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





