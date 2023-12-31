import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecshop/Screen/signup/regestration_image.dart';
import 'package:ecshop/common/login_signup/customeClippper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final List<String> districtsItem = [
    'Select District',
    'Dhaka',
    'Khulna',
    'Rajshahi',
    'Chittagram',
  ];
  final List<String> upozilasitem = [
    "Select Union",
    'Metro 1',
    'Metro 2',
    'Metro 3',
    'Metro 4',
  ];
  final List<String> areaItems = [
    "Select Area",
    'Area 1',
    'Area 2',
    'Area 3',
    'Area 4',
  ];
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _ShopAddressController = TextEditingController();
  String? firstnameErrorText;
  bool isfirstNameError = false;
  String? lastnameErrorText;
  bool islastNameError = false;
  String? emailAddressErrorText;
  bool isemailaddressError = false;
  String? phonenumberErrortext;
  bool isPhonenumberError = false;
  String? shopnameErrorText;
  bool isshopnameError = false;
  String? shopAddressErrorText;
  bool isShopaddressError = false;
  String? selectedValueDistrict;
  bool isdistrictError = false;
  String? selectedValueUpozilathana;
  bool isupozillathanaError = false;
  String? selectedValueAreawordunion;
  bool isAreawardunionError = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValueDistrict = districtsItem[0];
    selectedValueUpozilathana = upozilasitem[0];
    selectedValueAreawordunion = areaItems[0];
  }

  void _validateDistrict(String selectedDistrict) {
    if (selectedDistrict.isEmpty) {
      setState(() {
        selectedValueDistrict = districtsItem[0];
        isdistrictError=true;
      });
      // return 'Select Any option';
    }
    else {
      if(selectedDistrict==districtsItem[0]){
        setState(() {
          selectedValueDistrict = districtsItem[0];
          isdistrictError=true;
         // log("<=================check error for selecting select district====================>");
        });
      }else{
        setState(() {
          selectedValueDistrict = selectedDistrict;
          isdistrictError=false;
        });
      }
    }
    // return null;
  }

  void _validateUpozillathana(String selectedUpozila) {
    if (selectedUpozila.isEmpty) {
      setState(() {
        selectedValueUpozilathana = upozilasitem[0];
        isupozillathanaError=true;
      });
      //return 'Select Any option';
    }
    else {
      if(selectedUpozila==upozilasitem[0]){
        setState(() {
          selectedValueUpozilathana=upozilasitem[0];
          isupozillathanaError=true;
        });
      }
      else{
        setState(() {
          selectedValueUpozilathana=selectedUpozila;
          isupozillathanaError=false;
        });
      }
    }
  }

  void _validateAreawordunion(String selectedArea) {
    if (selectedArea.isEmpty) {
      setState(() {
        selectedValueAreawordunion = areaItems[0];
        isAreawardunionError=true;
      });
    } else {
      if(selectedArea == areaItems[0]){
      setState(() {
        selectedValueAreawordunion=areaItems[0];
        isAreawardunionError=true;
      });
      }
      else{
        setState(() {
          selectedValueAreawordunion=selectedArea;
          isAreawardunionError=false;
        });
      }
    }
  }

  String? _validateFirstname(value) {
    RegExp fnregex = RegExp(r'^[A-Za-z\s]{3,10}$');
    if (value!.isEmpty || value.length > 10) {
      setState(() {
        firstnameErrorText = "Please Enter your First Name ";
        isfirstNameError = true;
      });
      return 'Please Enter your First Name ';
    }
    if (!fnregex.hasMatch(value)) {
      setState(() {
        firstnameErrorText = 'Please Enter a Valid Name';
        isfirstNameError = true;
      });
      return 'Please Enter a Valid Name';
    } else {
      setState(() {
        isfirstNameError = false;
        firstnameErrorText = "";
      });
    }
    return null;
  }

  String? _validatelastname(value) {
    RegExp lnregex = RegExp(r'^[a-zA-Z\s]{3,10}$');
    if (value!.isEmpty || value.length > 10) {
      setState(() {
        lastnameErrorText = 'Please enter Your Last Name';
        islastNameError = true;
      });
      return 'Please Enter your Last Name';
    } else if (!lnregex.hasMatch(value)) {
      setState(() {
        lastnameErrorText = "Please enter a Valid Name";
        islastNameError = true;
      });
      return 'Enter a Valid Name';
    } else {
      setState(() {
        islastNameError = false;
        lastnameErrorText = "";
      });
    }
    // return null;
  }

  String? _validateEmail(value) {
    RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value!.isEmpty) {
      setState(() {
        emailAddressErrorText = 'Please enter your email';
        isemailaddressError = true;
      });
      return 'Please enter your email';
    } else if (!emailRegExp.hasMatch(value)) {
      setState(() {
        emailAddressErrorText = 'Please Enter a Valid Email';
        isemailaddressError = true;
      });
      return 'Please Enter a Valid Email';
    } else {
      setState(() {
        emailAddressErrorText = '';
        isemailaddressError = false;
      });
    }
    // return null ;
  }

  String? _validatePhoneNumber(value) {
    RegExp phonregex = RegExp(r'^(01|\+880)\d{9,13}$');
    if (value!.isEmpty || value.length > 14) {
      setState(() {
        isPhonenumberError = true;
        phonenumberErrortext = 'Please enter a phone Number';
      });
      return 'Please enter a phone Number';
    } else if (!phonregex.hasMatch(value)) {
      setState(() {
        isPhonenumberError = true;
        phonenumberErrortext = 'Please Enter a Valid Phone number';
      });
      return 'Please Enter a Valid Phone Number';
    } else {
      setState(() {
        isPhonenumberError = false;
        phonenumberErrortext = '';
      });
    }
    // return null;
  }
  String? _validateShopname(value) {
    // RegExp shopname = RegExp(r'^[a-zA-Z0-9\s&(),.!-]+$');
    if (value!.isEmpty) {
      setState(() {
        shopnameErrorText='Enter Your Shop Name';
        isshopnameError = true;
      });
      return 'Enter a Valid Shop Name';
    }
    // else if (!shopname.hasMatch(value)) {
    //   setState(() {
    //     shopAddressErrorText = "Please enter a valid shop address ";
    //     isShopaddressError = true;
    //   });
    //   return 'Please Enter a Valid Shop Address ';
    // }

    else {
      setState(() {
        shopnameErrorText = "";
        isshopnameError= false;
      });
    }// return null;
  }
  String? _validateShopadd(value) {
    RegExp shopaddregex = RegExp(r'^[a-zA-Z0-9\s&(),.!-]+$');
    if (value!.isEmpty) {
      setState(() {
        shopAddressErrorText = "Enter Your Shop Address";
        isshopnameError = true;
      });
      return 'Enter a Valid Shop Address';
    } else if (!shopaddregex.hasMatch(value)) {
      setState(() {
        shopAddressErrorText = "Please enter a valid shop address ";
        isShopaddressError = true;
      });
      return 'Please Enter a Valid Shop Address ';
    } else {
      setState(() {
        shopAddressErrorText = "";
        isShopaddressError = false;
      });
    }
    // return null;
  }



  FocusNode firstname = FocusNode();
  FocusNode lastname = FocusNode();
  FocusNode emailaddress = FocusNode();
  FocusNode phonenumber = FocusNode();
  FocusNode shopname = FocusNode();
  FocusNode district = FocusNode();
  FocusNode upozillaThana = FocusNode();
  FocusNode areawordunion = FocusNode();
  FocusNode shopaddress = FocusNode();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailAddressController.dispose();
    _phoneNumberController.dispose();
    _shopNameController.dispose();
    _ShopAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffF3F3F3),
          body: SingleChildScrollView(
            child: Container(
                height: _height,
                width: _width,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: Traingle(),
                      child: Container(
                        color: Color(0xffFEFEFE),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          // height: 50,
                          height: _height * (.10/660),
                        ),
                        Image.asset(
                          'assets/logo/bppshop_banner.png',
                          // height: 50,
                          // width: 260,
                          height: _height * (50/660),
                          width: _width *(220/360),
                          fit: BoxFit.contain,
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(horizontal: 5),
                          // margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(horizontal: _width * (5/360)),
                          margin: EdgeInsets.symmetric(horizontal: _width * (10/360)),
                          width: _width,
                          height: _height * .81,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFFFFFF),
                          ),
                          // color: Colors.blueAccent,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5,),
                                child: Text(
                                  "Become A Seller",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Wellcome to Seller Registration",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 1.0,
                                  thickness: .5,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Seller info",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),

                                    ///////////////////////////////////////Fisrt name with Text Field property
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.0, right: 5.0),
                                      child: Container(
                                        width: _width * .02,
                                        height: _height * .05,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isfirstNameError
                                                ? Colors.red
                                                : Colors.blue,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 2,
                                                            color: isfirstNameError
                                                                ? Colors.red
                                                                : Colors
                                                                    .blueAccent)),
                                                  ),
                                                  width: _width * .08,
                                                  height: _height * .05,
                                                  // color: Color(0xFBB0E0E),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      "First Name",
                                                      style: TextStyle(
                                                        color: Colors.brown,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                //  height: _height*.05,
                                                //  width:_width*.6,
                                                child: TextFormField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  focusNode: firstname,
                                                  onFieldSubmitted: (value) {
                                                    FocusScope.of(context)
                                                        .requestFocus(lastname);
                                                  },
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        45),
                                                  ],
                                                  onChanged: (value) {
                                                    _validateFirstname(value);
                                                  },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  controller:
                                                      _firstNameController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    isfirstNameError
                                        ? Text(
                                            "${firstnameErrorText}",
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.0, right: 2.0),
                                      child: Container(
                                        height: _height * .05,
                                        width: _width * .02,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: islastNameError
                                                  ? Colors.red
                                                  : Colors.blueAccent,
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 2,
                                                            color: islastNameError
                                                                ? Colors.red
                                                                : Colors
                                                                    .blueAccent)),
                                                  ),
                                                  width: _width * .08,
                                                  height: _height * .05,
                                                  // color: Color(0xFBB0E0E),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      "Last name",
                                                      style: TextStyle(
                                                        color: Colors.brown,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                height: _height * .05,
                                                child: TextFormField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  focusNode: lastname,
                                                  onFieldSubmitted: (value) {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            emailaddress);
                                                  },
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  )),
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        45),
                                                  ],
                                                  onChanged: (value) {
                                                    _validatelastname(value);
                                                  },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  controller: _lastNameController,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    islastNameError
                                        ? Text(
                                            "${lastnameErrorText}",
                                            style: TextStyle(
                                                color: Colors.redAccent),
                                          )
                                        : SizedBox.shrink(),

                                    // SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.0, right: 2.0, top: 3.0),
                                      child: Container(
                                        height: _height * .05,
                                        width: _width * .02,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isemailaddressError
                                                ? Colors.red
                                                : Colors.blueAccent,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                width: 2,
                                                color: isemailaddressError
                                                    ? Colors.red
                                                    : Colors.blueAccent,
                                              ))),
                                              width: _width * .08,
                                              height: _height * .05,
                                              // color: Color(0xFBB0E0E),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Text(
                                                  "Email address",
                                                  style: TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ),
                                            )),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                height: _height * .05,
                                                // width:_width*.6,
                                                child: TextFormField(
                                                  focusNode: emailaddress,
                                                  onFieldSubmitted: (value) {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            phonenumber);
                                                  },
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  )),
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        45),
                                                  ],
                                                  onChanged: (value) {
                                                    // setState(() {
                                                    //   isemailaddressError=false;
                                                    //   emailAddressErrorText='';
                                                    // });
                                                    _validateEmail(value);
                                                  },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  controller:
                                                      _emailAddressController,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    isemailaddressError
                                        ? Text(
                                            "${emailAddressErrorText}",
                                            style: TextStyle(
                                                color: Colors.redAccent),
                                          )
                                        : SizedBox.shrink(),
                                    // SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.0, right: 2.0, top: 3.0),
                                      child: Container(
                                        width: _width * .02,
                                        height: _height * .05,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isPhonenumberError
                                                ? Colors.red
                                                : Colors.blueAccent,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 2,
                                                            color: isPhonenumberError
                                                                ? Colors.red
                                                                : Colors
                                                                    .blueAccent)),
                                                  ),
                                                  width: _width * .02,
                                                  height: _height * .05,
                                                  // color: Color(0xFBB0E0E),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      "Phone Number",
                                                      style: TextStyle(
                                                        color: Colors.brown,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                height: _height * .05,
                                                width: _width * .6,
                                                child: TextFormField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  focusNode: phonenumber,
                                                  onFieldSubmitted: (value) {
                                                    FocusScope.of(context)
                                                        .requestFocus(shopname);
                                                  },
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  )),
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        14),
                                                  ],
                                                  onChanged: (value) {
                                                    _validatePhoneNumber(value);
                                                  },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller:
                                                      _phoneNumberController,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    isPhonenumberError
                                        ? Text(
                                            "${phonenumberErrortext}",
                                            style: TextStyle(
                                                color: Colors.redAccent),
                                          )
                                        : SizedBox.shrink(),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 3.0,
                                      thickness: 2,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ////////////////////////Shopname/////////////////
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.0, right: 2.0, top: 3.0),
                                      child: Container(
                                        height: _height * .05,
                                        width: _width * .02,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isshopnameError
                                                ? Colors.red
                                                : Colors.blueAccent,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                      width: 2,
                                                      color: isshopnameError
                                                          ? Colors.red
                                                          : Colors.blueAccent,
                                                    )),
                                                  ),
                                                  width: _width * .08,
                                                  height: _height * .05,
                                                  // color: Color(0xFBB0E0E),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      "Shop name",
                                                      style: TextStyle(
                                                        color: Colors.brown,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 2,
                                              //padding: const EdgeInsets.only(right: 8.0),
                                              child: Container(
                                                height: _height * .05,
                                                //width:_width*.6,
                                                child: TextFormField(
                                                    textInputAction: TextInputAction.next,
                                                    focusNode: shopname,
                                                    onFieldSubmitted: (value) {
                                                      FocusScope.of(context).requestFocus(shopaddress);
                                                    },
                                                    onChanged: (value) {
                                                      _validateShopname(value);
                                                    },
                                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                                    controller:
                                                        _shopNameController,
                                                    decoration: InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                      borderSide: BorderSide.none,
                                                    ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    isshopnameError
                                        ? Text("${shopnameErrorText}",
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                            ))
                                        : SizedBox.shrink(),
                                    // SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.0, right: 2.0, top: 3.0),
                                      child: Container(
                                        width: _width * .02,
                                        height: _height * .05,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isdistrictError
                                                ? Colors.red
                                                : Colors.blue,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                    width: 2,
                                                    color: isdistrictError
                                                        ? Colors.red
                                                        : Colors.blueAccent,
                                                  ))),
                                                  width: _width * .08,
                                                  height: _height * .05,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      "District/City",
                                                      style: TextStyle(
                                                        color: Colors.brown,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  height: _height * .05,
                                                  // width:_width*.3,
                                                  child: Center(
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                      child:
                                                          DropdownButton2<String>(
                                                        focusNode: district,
                                                        isExpanded: true,
                                                        items: districtsItem
                                                            .map((String item) =>
                                                                DropdownMenuItem<
                                                                    String>(
                                                                  value: item,
                                                                  child: Text(
                                                                    item,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ))
                                                            .toList(),
                                                        value:
                                                            selectedValueDistrict,
                                                        onChanged: (value) {
                                                          _validateDistrict(value!);
                                                        },
                                                        buttonStyleData:
                                                            const ButtonStyleData(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 16),
                                                          height: 40,
                                                          width: 225,
                                                        ),
                                                        menuItemStyleData:
                                                            const MenuItemStyleData(
                                                          height: 40,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // isdistrictError?Text("${selectedValueDistrict}"):SizedBox.shrink(),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.0, right: 2.0, top: 3.0),
                                      child: Container(
                                        height: _height * .05,
                                        width: _width * .02,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: isupozillathanaError
                                                ? Colors.red
                                                : Colors.blue,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  width: _width * .02,
                                                  height: _height * .05,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                    width: 2,
                                                    color: isupozillathanaError
                                                        ? Colors.red
                                                        : Colors.blue,
                                                  ))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      "Upozilla/Thana",
                                                      style: TextStyle(
                                                        color: Colors.brown,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 8.0),
                                                child: Container(
                                                  padding: const EdgeInsets.all(8.0),
                                                  height: _height * .05,
                                                  child: Center(
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton2<String>(
                                                              focusNode: upozillaThana,
                                                              isExpanded: true,
                                                              items: upozilasitem
                                                                  .map((String item) =>
                                                                      DropdownMenuItem<
                                                                          String>(
                                                                        value: item,
                                                                        child: Text(
                                                                          item,
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                      ))
                                                                  .toList(),
                                                              value: selectedValueUpozilathana,
                                                              onChanged: (value) {
                                                                _validateUpozillathana(value!);
                                                              },
                                                              buttonStyleData: const ButtonStyleData(
                                                                padding: EdgeInsets.symmetric(horizontal: 16),
                                                                height: 40,
                                                                width: 225,
                                                              ),
                                                              menuItemStyleData:
                                                                  const MenuItemStyleData(
                                                                height: 40,
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.0, right: 2.0, top: 3.0),
                                      child: Container(
                                        height: _height * .05,
                                        width: _width * .02,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: isAreawardunionError
                                                ? Colors.red
                                                : Colors.blue,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                    width: 2,
                                                    color: isAreawardunionError
                                                        ? Colors.red
                                                        : Colors.blue,
                                                  ))),
                                                  width: _width * .02,
                                                  height: _height * .05,
                                                  // color: Color(0xFBB0E0E),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      "Area/Ward/Union",
                                                      style: TextStyle(
                                                        color: Colors.brown,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Container(
                                                  height: _height * .05,
                                                  width: _width * .3,
                                                  child: Center(
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                      child:
                                                          DropdownButton2<String>(
                                                        focusNode: areawordunion,
                                                        isExpanded: true,
                                                        items: areaItems
                                                            .map((String item) =>
                                                                DropdownMenuItem<
                                                                    String>(
                                                                  value: item,
                                                                  child: Text(
                                                                    item,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ))
                                                            .toList(),
                                                        value:
                                                            selectedValueAreawordunion,
                                                        onChanged: (value) {
                                                          // setState(() {
                                                          //   selectedValueAreawordunion = value;
                                                          // });
                                                          _validateAreawordunion(
                                                              value!);
                                                        },
                                                        buttonStyleData:
                                                            const ButtonStyleData(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 16),
                                                          height: 40,
                                                          width: 225,
                                                        ),
                                                        menuItemStyleData:
                                                            const MenuItemStyleData(
                                                          height: 40,
                                                        ),
                                                        //validator: (value) =>value == null ? 'Please Select Any':null,
                                                        //     onChanged:(value){
                                                        //     setState(() {
                                                        //       selectItemerror=false;
                                                        //       itemErrorText='';
                                                        //     });
                                                        //     _validateItem(value);
                                                        //     }
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, top: 3.0),
                                      child: Container(
                                        height: _height * .08,
                                        width: _width * .09,
                                        child: TextFormField(
                                          textInputAction: TextInputAction.done,
                                          focusNode: shopaddress,
                                          maxLines: 2,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(30),
                                          ],
                                          onChanged: (value) {
                                            _validateShopadd(value);
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          controller: _ShopAddressController,
                                          decoration: InputDecoration(
                                            hintText: "Add shop Address",
                                            border:OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            )
                                          ),
                                          // validator: _validateShopadd,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: isShopaddressError? Colors.red:Colors.blueAccent,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    isShopaddressError
                                        ? Text(
                                            "${shopAddressErrorText}",
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (_firstNameController.text.isNotEmpty &&
                                              _lastNameController.text.isNotEmpty &&
                                              _emailAddressController.text.isNotEmpty &&
                                              _phoneNumberController.text.isNotEmpty &&
                                              _shopNameController.text.isNotEmpty &&
                                              _ShopAddressController.text.isNotEmpty
                                              && isdistrictError!=true &&isupozillathanaError!=true
                                              && isAreawardunionError!=true
                                          ) {
                                            // setState(() {
                                            //   dcerror=false;
                                            // });

                                            // if(selectedValueDc=="Select District"){
                                            //   setState(() {
                                            //     dcerror=true;
                                            //   });
                                            // }
                                            // if(selectedValueUt == "Select Union"){
                                            //   setState(() {
                                            //     uterror=true;
                                            //   });
                                            // }
                                            // if(selectedValueAwu =="Select Area"){
                                            // setState(() {
                                            //   Awuerror=true;
                                            // });
                                            // }
                                            setState(() {
                                              isfirstNameError = false;
                                              firstnameErrorText = '';
                                              islastNameError = false;
                                              lastnameErrorText = '';
                                              isemailaddressError = false;
                                              emailAddressErrorText = '';
                                              isPhonenumberError = false;
                                              phonenumberErrortext = '';
                                              isshopnameError = false;
                                              shopnameErrorText = '';
                                              isShopaddressError = false;
                                              shopAddressErrorText = '';
                                              isdistrictError = false;
                                              isupozillathanaError = false;
                                              isAreawardunionError = false;
                                              selectedValueDistrict = districtsItem[0];
                                              selectedValueUpozilathana = upozilasitem[0];
                                              selectedValueAreawordunion = areaItems[0];
                                            });
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Imageregistration()),
                                            );
                                          } else {
                                            if (_firstNameController
                                                .text.isEmpty) {
                                              setState(() {
                                                isfirstNameError = true;
                                                firstnameErrorText =
                                                    'Please Enter a Valid Name';
                                              });
                                            }
                                            if (_lastNameController
                                                .text.isEmpty) {
                                              setState(() {
                                                islastNameError = true;
                                                lastnameErrorText =
                                                    'Please Enter a Valid Name';
                                              });
                                            }
                                            if (_emailAddressController
                                                .text.isEmpty) {
                                              setState(() {
                                                isemailaddressError = true;
                                                emailAddressErrorText =
                                                    'Please Enter a Valid Email';
                                              });
                                            }
                                            if (_phoneNumberController
                                                .text.isEmpty) {
                                              setState(() {
                                                isPhonenumberError = true;
                                                phonenumberErrortext =
                                                    "Enter Phone number Start with 01 or +880";
                                              });
                                            }
                                            if (_shopNameController
                                                .text.isEmpty) {
                                              setState(() {
                                                isshopnameError = true;
                                                shopnameErrorText =
                                                    'Enter Valid Shop Name';
                                              });
                                            }
                                            if (_ShopAddressController
                                                .text.isEmpty) {
                                              setState(() {
                                                isShopaddressError = true;
                                                shopAddressErrorText =
                                                    'Enter Correct Address';
                                              });
                                            }
                                            // if(selectedValueDc=="Select District"){
                                            //   setState(() {
                                            //     dcerror=true;
                                            //   });

                                            if (selectedValueDistrict == districtsItem[0]) {
                                              setState(() {
                                                isdistrictError = true;
                                              });
                                            }
                                            if (selectedValueUpozilathana == upozilasitem[0]) {
                                              setState(() {
                                                isupozillathanaError = true;
                                              });
                                            }
                                            if (selectedValueAreawordunion == areaItems[0]) {
                                              setState(() {
                                                isAreawardunionError = true;
                                              });
                                            }
                                            // if(isupozillathanaError!=false){
                                            //   setState(() {
                                            //     selectedValueUpozilathana='Select Upozola / Thana ';
                                            //     isupozillathanaError=true;
                                            //   });
                                            // }
                                            // if(isAreawardunionError!=false){
                                            //   setState(() {
                                            //     selectedValueAreawordunion='Select Area';
                                            //     isAreawardunionError=true;
                                            //   });
                                            // }
                                          }
                                        },
                                        child: Text("Next")),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Already have a Account"),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                         Imageregistration()),
                                              );
                                            },
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 20.0),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
