import 'package:ecshop/Screen/signup/registration.dart';
import 'package:ecshop/common/login_signup/customeClippper.dart';
import 'package:flutter/material.dart';
import '../homepage.dart';

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
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
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
              height: _height,
              width: _width,
              child: Center(
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: Traingle(),
                      child: Container(
                        color: Color(0xffFEFEFE),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,),
                        Image.asset("assets/logo/bppshop_banner.png",height: 50,width: 260,fit: BoxFit.contain,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: _width,
                          height: _height * .4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Color(0xFFFFFFFF)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Wellcome to Seller login",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 1.0,
                                  thickness: .4,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SingleChildScrollView(
                                child: Form(
                                  key: _formKey1,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Mobile",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black38,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: _height *.06,
                                        width: _width * .6,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isMobileNoError?Colors.red:Colors.blue,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          controller: _phoneNumberController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            hintText: "Enter mobile Number",
                                          ),
                                          onChanged: (value){
                                           _validatePhoneNumber(value);
                                          },
                                        ),
                                      ),
                                      isMobileNoError?Text("${mobileErrorText}",style: TextStyle(color: Colors.redAccent),):SizedBox.shrink(),
                                     // SizedBox(height: 10,),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Password",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black38,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: _height * .06,
                                        width: _width * .6,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isPasswordError?Colors.red : Colors.blue,
                                          ),borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          obscureText: true,
                                          controller: _passWordController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            hintText: "Enter Password",
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
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            "Remember me ",
                                            style: TextStyle(fontSize: 15),
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
                                              child: Text(
                                                "Forgot password ?",
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                ),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                width: _width,
                                child: ElevatedButton(
                                    onPressed: (){
                                      if(_phoneNumberController.text.isNotEmpty && _passWordController.text.isNotEmpty ){
                                        setState(() {
                                          isMobileNoError=false;
                                          mobileErrorText='';
                                          isPasswordError=false;
                                          passwordErrorText='';
                                        });
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Newone()),);
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
                                  child: Text("Sign in")),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Become a seller"),
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
                                            decoration:
                                            TextDecoration.underline),
                                      ))
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
// Future openDialog() => showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//     title: Text("Enter phone number"),
// ));
// class _Traingle extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(size.width * 0.4, -size.height * 0.2);
//     path.lineTo(0, size.height);
//     path.lineTo(size.width + 40, size.height * 0.3);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => true;
// }