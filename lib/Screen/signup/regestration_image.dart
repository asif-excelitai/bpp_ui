import 'package:easy_localization/easy_localization.dart';
import 'package:ecshop/Screen/signup/registration.dart';
import 'package:ecshop/common/login_signup/customeClippper.dart';
import 'package:ecshop/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

import '../../utils/helpers/helper_function.dart';
import '../login/loginscreen.dart';
import '../HomePage/homepage.dart';
import '../widgets/clipPath.dart';
import '../widgets/divider.dart';
import '../widgets/headerlogo.dart';

class Imageregistration extends StatefulWidget {
  const Imageregistration({super.key});

  @override
  State<Imageregistration> createState() => _ImageregistrationState();
}

class _ImageregistrationState extends State<Imageregistration> {
  File? _imageFile;
  String? _imageName;
  File? _imagebanner;
  String? _imagebannername;
  String? _imageErrorText='';
  String? _imagebannerErrorText='';
  bool isImageblank=false;
  bool isImagebannerblank=false;
  String? passwordErrorText = '';
  String? repasswordErrorText = '';
  bool ispasserror = false;
  bool isrepasserror = false;
  var _isObscured;
  final _formKey1 = GlobalKey<FormState>();
  // void _submitForm1(){
  //   if(_formKey1.currentState!.validate()){
  //     {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => Newone()),
  //
  //       );
  //       // Text("Success");
  //     }
  //   }
  // }
  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }
  void _validationImagesquare(){
    if(_imageFile == null){
    setState(() {
        isImageblank=true;
      _imageErrorText="Please Upload a image";

    });
    }
    else{
      setState(() {
        isImageblank=false;
        _imageErrorText='';
      });

    }
  }
  void _validationImageBanner(){
    if(_imagebanner == null){
      setState(() {
        isImagebannerblank=true;
        _imagebannerErrorText='Please Upload your banner';
      });
    }
    else{
      setState(() {
        isImagebannerblank=false;
        _imagebannerErrorText='';
      });
    }

  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (source == ImageSource.gallery) {
      if (pickedFile != null) {
        final File pickedImage = File(pickedFile.path);
        // Check if the image has a 1:1 aspect ratio (square)
        final imageBytes = await pickedImage.readAsBytes();
        final decodedImage = await decodeImageFromList(imageBytes);
        final imageFileName = path.basename(pickedImage.path);

        if (decodedImage.width == decodedImage.height) {
          setState(() {
            _imageFile = pickedImage;
            _imageName = path.basename(imageFileName).split('/').last;
          });
        } else {
          // Show an error message or handle non-square images
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Invalid Image Aspect Ratio'),
                content: Text(
                    'Please select an image with a 1:1 aspect ratio (square).'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    } else if (source == ImageSource.camera) {
      if (pickedFile != null) {
        final imageFileName = path.basename(pickedFile.path);
        CroppedFile? cropped = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: 'Crop',
                  cropGridColor: Colors.black,
                  initAspectRatio: CropAspectRatioPreset.original,
                  lockAspectRatio: true),
              IOSUiSettings(title: 'Crop')
            ]);

        if (cropped != null) {
          setState(() {
            _imageFile = File(cropped.path);
            // _imageName = imageFileName;
            _imageName = path.basename(imageFileName).split('/').last;
          });
        }
      }
    }
  }
  Future<void> _pickBanner(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (source == ImageSource.gallery) {
      if (pickedFile != null) {
        final File pickedBImage = File(pickedFile.path);
        // Check if the image has a 6:1 aspect ratio (square)
        final imageBytes = await pickedBImage.readAsBytes();
        final decodedImage = await decodeImageFromList(imageBytes);
        final imageFileName = path.basename(pickedBImage.path);
        // log("check image width=======> ${decodedImage.width}");
        // log("check image height=======> ${decodedImage.height*6}");
        if (decodedImage.width == decodedImage.height * 6) {
          setState(() {
            _imagebanner = pickedBImage;
            _imagebannername = imageFileName;
          });
        } else {
          // Show an error message or handle non-square images
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Invalid Image Aspect Ratio'),
                content:
                    Text('Please select an image with a 6:1 aspect ratio '),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    } else if (source == ImageSource.camera) {
      if (pickedFile != null) {
        final imageFileName1 = path.basename(pickedFile.path);
        CroppedFile? croppedB = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatio: CropAspectRatio(ratioX: 6, ratioY: 1),
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: 'Crop',
                  cropGridColor: Colors.black,
                  initAspectRatio: CropAspectRatioPreset.original,
                  lockAspectRatio: true),
              IOSUiSettings(title: 'Crop')
            ]);

        if (croppedB != null) {
          setState(() {
            _imagebanner = File(croppedB.path);
            _imagebannername = imageFileName1;
          });
        }
      }
    }
  }

  bool ischeckd = false;
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  String? _validatePassword(value) {
    if (value!.isEmpty) {
      setState(() {
        passwordErrorText = 'Please Enter password';
        ispasserror = true;
      });
      return 'Please Enter a Password';
    }
    // RegExp passregexp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
    // r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$
    else {
      if (value.length! < 8) {
        setState(() {
          passwordErrorText = 'Enter Password more than 8 Character';
          ispasserror = true;
        });
        return 'Enter Password more than 8 Character';
      }
     else if (value != _repasswordController.text) {
        setState(() {
          repasswordErrorText = 'Enter Correct pass';
          isrepasserror = true;
        });
        return 'Please Match your password';
      }
     else {
        setState(() {
          passwordErrorText ='';
          ispasserror = false;
          isrepasserror=false;
        });
      }
      return null;
    }
  }

  String? _Validaterepassword(value) {
    if (value!.isEmpty) {
      setState(() {
        repasswordErrorText = 'Please Retype Password';
        isrepasserror = true;
      });
      return 'Please Retype Password';
    }
   else{
      if (value.length! < 8){
        setState(() {
          repasswordErrorText='Enter Password more than 8 Character';
          isrepasserror=true;
        });
        return 'Enter Password more than 8 Character';
      }
      else if (value != _passwordController.text) {
        setState(() {
          repasswordErrorText = 'Password is not matching';
          isrepasserror = true;
        });
        return 'Please Match your password';
      }
      else setState(() {
        repasswordErrorText = '';
        isrepasserror = false;
        ispasserror=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _weidth = MediaQuery.of(context).size.width;
    final dark=SHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF3F3F3),
          // resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              width: SDeviceUtlis.getScreenWidth(context),
              height: SDeviceUtlis.getScreenHeight(context),
              child: Stack(
                children: [
                  ClipPathwidget(dark: dark),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        // height: _height / 150,
                        height: SDeviceUtlis.getScreenHeight(context)*.010,
                      ),
                     const HeaderLogo(),
                      Form(
                        key: _formKey1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: SDeviceUtlis.getScreenWidth(context)*.020),
                          margin: EdgeInsets.symmetric(horizontal:SDeviceUtlis.getScreenWidth(context)*.02),
                          width: SDeviceUtlis.getScreenWidth(context),
                          height: _height * .85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:dark?Colors.lightBlueAccent : Color(0xFFFFFFFF),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Become a seller".tr().toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff334257)),
                              ),
                              Text(
                                "Welcome to seller Registration".tr().toString(),
                                style: TextStyle(fontSize: SDeviceUtlis.getScreenHeight(context)*.020,color: Color(0xff667180)),
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.005,
                              ),
                              const gDivider(),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.001,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: _height / 7,
                                        width: _weidth / 3,
                                        // color: Colors.red,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        //: const Icon(Icons.image,color: Colors.lightBlue,),

                                        child: AspectRatio(
                                            aspectRatio: 1.0,
                                            child: _imageFile == null
                                                ? Container(
                                                    height: _height / 7,
                                                    width: _weidth / 3,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(8)),
                                                      border: Border.all(
                                                          color:
                                                              Colors.blueAccent,
                                                          width: 2),
                                                    ),
                                            child: Center(child: Image.asset("assets/logo/gallery.jpg",fit: BoxFit.fill),),
                                            )
                                                : Image.file(
                                                    _imageFile!,
                                                    fit: BoxFit.cover,)),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            alignment: Alignment.center,
                                            height: _height / 17,
                                            width: _weidth / 1.8,
                                            //color: Colors.green,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  width: 3,
                                                  color: Colors.blue,
                                                )),
                                            child: _imageName != null
                                                ? Text('$_imageName')
                                                : Text("Upload Shop logo/Image")

                                            // '${_imagebanner!.path.split('/').last}
                                            ),
                                        SizedBox(
                                          height: _height *.025,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        child: Center(
                                                          child: Container(
                                                            width: _weidth / 3,
                                                            height: _height / 7,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .redAccent,
                                                                    border: Border.all(
                                                                        width:
                                                                            3,
                                                                        color: Colors
                                                                            .blueGrey),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10),
                                                                    )),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      _pickImage(
                                                                          ImageSource
                                                                              .gallery);
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            backgroundColor: Colors
                                                                                .white10),
                                                                    child: Icon(
                                                                        Icons
                                                                            .camera)),
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      _pickImage(
                                                                          ImageSource
                                                                              .camera);
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            backgroundColor: Colors
                                                                                .white10),
                                                                    child: Icon(
                                                                        Icons
                                                                            .get_app_rounded)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(SDeviceUtlis.getScreenWidth(context) * (200/360), SDeviceUtlis.getScreenHeight(context) *(20/360)),
                                                  side: BorderSide(
                                                      width: 2,
                                                      color: Color(0xffDBDCE1)),
                                                      shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)),
                                                      backgroundColor: Color(0xffDBDCE1)

                                                     ),
                                            child:Text(
                                              "Browse".tr().toString(),
                                              style: TextStyle(
                                                  color: Color(0xff269DD8),
                                                  fontSize: SDeviceUtlis.getScreenHeight(context) * .019
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                height: _height * .1,
                                width: _weidth,
                                //color: Colors.redAccent,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    )),
                                child: AspectRatio(
                                    aspectRatio: 6.0,
                                    child: _imagebanner == null
                                        ? Container(
                                            height: _height / 7,
                                            width: _weidth / 3,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              border: Border.all(
                                                  color: Colors.blueAccent,
                                                  width: 2),
                                            ),
                                    child: Center(
                                      child: Image.asset("assets/logo/gallery.jpg",fit: BoxFit.fitWidth),
                                    ),
                                    )
                                        : Image.file(
                                            _imagebanner!,
                                            fit: BoxFit.cover,
                                          )),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 55,
                                width: _weidth,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: _imagebannername != null
                                        ? Text('$_imagebannername')
                                        : Text(
                                            "Upload banner/Signboard Picture")),
                              ),
                              SizedBox(height: SDeviceUtlis.getScreenHeight(context)*.003,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              child: Center(
                                                child: Container(
                                                  width: _weidth / 3,
                                                  height: _height / 7,
                                                  decoration: BoxDecoration(
                                                      color: Colors.redAccent,
                                                      border: Border.all(
                                                          width: 3,
                                                          color: Colors.blueGrey),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      )),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(context)
                                                                .pop();
                                                            _pickBanner(
                                                                ImageSource
                                                                    .gallery);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                10),
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white10),
                                                          child:
                                                              Icon(Icons.camera)),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(context)
                                                                .pop();
                                                            _pickBanner(
                                                                ImageSource
                                                                    .camera);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                10),
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white10),
                                                          child: Icon(Icons
                                                              .get_app_rounded)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(200, 50),
                                        side: BorderSide(
                                            width: 2, color: Color(0xffDBDCE1)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        backgroundColor: Color(0xffDBDCE1)),
                                    child:  Text("Browse".tr().toString(),
                                      style: TextStyle(
                                          color: Color(0xff27A5D9),
                                          fontSize: SDeviceUtlis.getScreenHeight(context) * .018
                                      ),
                                    ),),
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.003,
                              ),
                              Container(
                                height:SDeviceUtlis.getScreenHeight(context) * .05,
                                width: SDeviceUtlis.getScreenWidth(context) * .99,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ispasserror
                                        ? Colors.red
                                        : Colors.blueAccent,
                                    width: 3,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                              width: 3,
                                              color: ispasserror
                                                  ? Colors.red
                                                  : Colors.blueAccent,
                                            )),
                                          ),
                                          width: SDeviceUtlis.getScreenWidth(context) * .04,
                                          height:SDeviceUtlis.getScreenHeight(context) * .05,
                                          // color: Color(0xFBB0E0E),
                                          child: Center(
                                            child: Text(
                                              "Password".tr().toString(),
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                               fontSize: SDeviceUtlis.getScreenHeight(context)*.017,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                      //padding: const EdgeInsets.only(right: 8.0),
                                      flex: 2,
                                      child: Container(
                                        height:SDeviceUtlis.getScreenHeight(context) * .05,
                                        child: TextFormField(
                                          onChanged: (value) {
                                            _validatePassword(value);
                                          },
                                          // validator: _validatePassword,
                                          obscureText: _isObscured,
                                          controller: _passwordController,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: _isObscured
                                                  ? Icon(Icons.visibility_off)
                                                  : Icon(Icons.visibility),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscured = !_isObscured;
                                                });
                                              },
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // ispasserror?Text("${passerrorText}",style: TextStyle(color: Colors.redAccent),):SizedBox.shrink(),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  height: SDeviceUtlis.getScreenHeight(context) * .05,
                                  width: SDeviceUtlis.getScreenWidth(context) * .99,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isrepasserror
                                          ? Colors.red
                                          : Colors.blueAccent,
                                      width: 3,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: isrepasserror
                                                            ? Colors.red
                                                            : Colors.blueAccent,
                                                        width: 3))),
                                            width: SDeviceUtlis.getScreenWidth(context) * .04,
                                            height: SDeviceUtlis.getScreenHeight(context) * .05,
                                            // color: Color(0xFBB0E0E),
                                            child: Center(
                                              child: Text(
                                                "Retype Password".tr().toString(),
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: SDeviceUtlis.getScreenHeight(context)*.017,
                                                ),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: _height * .05,
                                          child: TextFormField(
                                            onChanged: (value) {
                                              _Validaterepassword(value);
                                            },
                                            obscureText: _isObscured,
                                            controller: _repasswordController,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _isObscured = !_isObscured;
                                                  });
                                                },
                                                icon: _isObscured
                                                    ? Icon(Icons.visibility_off)
                                                    : Icon(Icons.visibility),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              isrepasserror
                                  ? Text(
                                      "${repasswordErrorText}",
                                      style: TextStyle(color: Colors.redAccent),
                                    )
                                  : SizedBox.shrink(),
                              // SizedBox(
                              //   height:SDeviceUtlis.getScreenHeight(context)*.00003,
                              // ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: ischeckd,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischeckd = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "I agree to your".tr().toString(),
                                    style: TextStyle(color: Color(0xff667180),
                                        fontSize: SDeviceUtlis.getScreenHeight(context)*.015),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Terms and Condition".tr().toString(),
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: SDeviceUtlis.getScreenHeight(context)*.016,fontWeight: FontWeight.bold,
                                          // decoration: TextDecoration.underline,),
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.0003,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Registration()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              vertical: SDeviceUtlis.getScreenWidth(context)*.015, horizontal: SDeviceUtlis.getScreenHeight(context)*.070),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          primary: Colors.white12),
                                      child: Text("Back".tr().toString(),style: TextStyle(
                                          color: const Color(0xff269DD8),
                                          fontSize: SDeviceUtlis.getScreenHeight(context) * .019
                                      ))),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (_passwordController.text.isNotEmpty &&
                                            _repasswordController
                                                .text.isNotEmpty &&
                                            ischeckd != false &&
                                            _imagebanner != null &&
                                            _imageFile != null) {
                                          setState(() {
                                          ispasserror=false;
                                          isrepasserror=false;
                                          });

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Newone()));
                                        }
                                        else{
                                          if(_passwordController.text.isEmpty){
                                            setState(() {
                                              ispasserror=true;
                                              passwordErrorText='Enter Password';
                                            });
                                          }
                                          if(_repasswordController.text.isEmpty){
                                            isrepasserror=true;
                                            repasswordErrorText="Please Enter your password and matching";
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              vertical: SDeviceUtlis.getScreenWidth(context)*.015, horizontal: SDeviceUtlis.getScreenHeight(context)*.070),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          primary: Colors.white12),
                                      child: Text("Submit".tr().toString(),style: TextStyle(
                                          color: Color(0xff269DD8),
                                          fontSize: SDeviceUtlis.getScreenHeight(context) * .019
                                      ))),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already Have a Account".tr().toString(), style: TextStyle(color: Color(0xff667180),
                                      fontSize: SDeviceUtlis.getScreenHeight(context)*.015)),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Mylogin()),
                                        );
                                      },
                                      child: Text(
                                        "Login".tr().toString(),
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: SDeviceUtlis.getScreenHeight(context)*.016,fontWeight: FontWeight.bold,
                                          // decoration: TextDecoration.underline,),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
