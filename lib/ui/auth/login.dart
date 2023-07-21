import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/login_controller.dart';
import '../../route/app_pages.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/common_form_button.dart';
import '../../utils/common_textfield.dart';
import '../../utils/font_styles.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put((LoginController()));
  bool obscureText = true;

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
                            "Log in",
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
                                      /*   controller: _registerController
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
                                  /*  controller:
                                      _registerController.phoneNoController,
                                */
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

/*
                          GetTextFormField(
                            isObscureText: false,
                            hintText: "Enter username or email address",
                            labelText: "Username",
                            controller: _loginController.emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorEmail;
                                }
                              }

                              */
/*  if(!Utils.isEmail(value.toString())){
                                              return AppConstants.validEmail;
                                            }*/ /*

                              return null;
                            },
                          ),
*/
                          U.addVerBox(size: 10),
                          GetTextFormField(
                            isObscureText: obscureText,
                            hintText: "Enter Password",
                            labelText: "Password",
                            controller: _loginController.passwordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorPassword;
                                }
                              }

                              return null;
                            },
                            passwordButton: IconButton(
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: CC.primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                            ),
                          ),
                          U.addVerBox(size: 16),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60.sp),
                            child: CommanFormButton(
                              labelText: "Log in",
                              isLoading: _loginController.isLoading.value,
                              enabled: !_loginController.isLoading.value,
                              loadingText: "Please wait",
                              callback: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                //_loginController.validate(context);
                                /* setState(() {
                                                isLoading = true;
                                              });
                                              Future.delayed(
                                                  const Duration(seconds: 3),
                                                  () {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              });*/
                              },
                            ),
                          ),
                        ],
                      ),
                    ))))));
/*
    });
*/
  }
}
