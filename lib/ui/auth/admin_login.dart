import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../controllers/login_controller.dart';
import '../../route/app_pages.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/common_form_button.dart';
import '../../utils/common_textfield.dart';
import '../../utils/font_styles.dart';
import '../../utils/utils.dart';

class AdminLoginScreen extends StatefulWidget {
  AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final LoginController _loginController = Get.put((LoginController()));
  bool obscureText = true;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
/*
    return Obx(() {
*/
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: 35.sp,
          child: Container(
            color: Colors.red,
            child: Container(
              height: 30.sp,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 0.sp),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.registration,
                        arguments: {"isfrom": "signin"});

                    /*          if (_loginController.isFrom.value == "signup") {
                      Get.back();
                    } else {
                      Get.toNamed(Routes.signUpScreen,
                          arguments: {"isfrom": "signin"});
                    }*/
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t have account? ',
                          style: St.SignUpBottomButtonText(15.sp),
                        ),
                        SizedBox(
                          width: 0.sp,
                        ),
                        Text(
                          'Sign Up',
                          style: St.SignUpBottomButtonBoldText(15.sp),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _loginController.formKey3,
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        CC.primaryColor,
                        CC.secondaryColor,
                        CC.thirdColor
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )),
                    child: SafeArea(
                        child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Admin",
                            style: St.RegulareNoteText(35.sp),
                            textAlign: TextAlign.center,
                          ),
                          U.addVerBox(size: 50),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: GetTextFormField(
                                      isObscureText: false,
                                      hintText: "",
                                      enableInteractiveSelection: false,
                                      enabled: false,
                                      /*   controller: _loginController
                                          .countryCodeController,
                                   */
                                      labelText: "+91",
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      ontap: () {},
                                      validator: (value) {},
                                    ),
                                  )
                                  /*showCountryPicker(
                                                      context: context,
                                                      showPhoneCode: true, // optional. Shows phone code before the country name.
                                                      onSelect: (Country country) {
                                                        print('Select country: ${country.displayName}');
                                                      },
                                                    ),*/
                                  ),
                              SizedBox(
                                width: 20.sp,
                              ),
                              Expanded(
                                flex: 3,
                                child: GetTextFormField(
                                  isObscureText: false,
                                  controller: _loginController.phoneController,
                                  hintText: "Enter Phone Number",
                                  labelText: "Phone Number",
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  inputType: TextInputType.number,
                                  validator: (value) {
                                    if (value != null) {
                                      if (value.isEmpty) {
                                        return AppConstants.errorMobile;
                                      }
                                      if (value.length != 10) {
                                        return AppConstants.validPhone;
                                      }
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          U.addVerBox(size: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60.sp),
                            child: CommanFormButton(
                              labelText: "Log in",
                              isLoading: _loginController.isLoading.value,
                              enabled: !_loginController.isLoading.value,
                              loadingText: "Please wait",
                              callback: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                Get.offNamed(Routes.adminDashboard);
                                /* generateOtp(
                                    "+91" +
                                        _loginController.phoneController.text,
                                    context);*/
                              },
                            ),
                          ),
                          U.addVerBox(size: 20),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Admin Login",
                              style: St.textFontRegular(
                                  color: CC.primaryColor,
                                  size: 16.sp,
                                  weight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ))))));
/*
    });
*/
  }

  Future<void> generateOtp(String contact, BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: contact,
        verificationCompleted: (PhoneAuthCredential credential) {
          _loginController.isLoading.value = false;
          print("credentials ------------------------->");
        },
        verificationFailed: (FirebaseAuthException e) {
          _loginController.isLoading.value = false;
          print(" FirebaseAuthException------------------------->");
        },
        timeout: const Duration(seconds: 60),
        codeSent: (String verificationId, int? resendToken) async {
          _loginController.isLoading.value = false;
          print(" verificationId------------------------->");
          var result = await Get.toNamed(Routes.verifyOtp,
              arguments: {"credentials": verificationId, "contact": contact});
          if (result != null) {}
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _loginController.isLoading.value = false;
          print(" codeAutoRetrievalTimeout------------------------->");
        },
      );
    } catch (e) {
      _loginController.isLoading.value = false;
      handleError(e as PlatformException, context);
      // Navigator.pop(context, (e as PlatformException).message);
    }
  }

  void handleError(PlatformException error, BuildContext context) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(FocusNode());
        errorMessage = 'Invalid Code';
        showAlertDialog(context, 'Invalid Code');
        break;
      default:
        showAlertDialog(context, error.message ?? "");
        break;
    }
  }

  void showAlertDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
