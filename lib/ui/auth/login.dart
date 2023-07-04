import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/login_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
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

                            /*  if(!Utils.isEmail(value.toString())){
                                              return AppConstants.validEmail;
                                            }*/
                            return null;
                          },
                        ),
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
                        U.addVerBox(16),

                        ],
                      ),
                    ))))));
/*
    });
*/
  }
}
