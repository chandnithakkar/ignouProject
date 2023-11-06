import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controllers/verify_otp_controller.dart';
import '../../route/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/common_form_button.dart';
import '../../utils/font_styles.dart';
import '../../utils/otp_input.dart';
import '../../utils/utils.dart';

class VerifyMobileOtp extends StatefulWidget {
  VerifyMobileOtp({Key? key}) : super(key: key);

  @override
  State<VerifyMobileOtp> createState() => _VerifyMobileOtpState();
}

class _VerifyMobileOtpState extends State<VerifyMobileOtp> {
  final VerifyOtpMobileController _verifyOtpController =
      Get.put(VerifyOtpMobileController());
  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )),
              child: Stack(children: [
                SafeArea(
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.sp,
                        ),
                        Text(
                          AppConstants.verifyOTP,
                          style: St.RegulareNoteText(30.sp),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child:
                                  // Implement 4 input fields
                                  Padding(
                            padding: EdgeInsets.all(2.0.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OtpInput(_verifyOtpController.fieldOne, true,
                                    false, false),
                                OtpInput(_verifyOtpController.fieldTwo, false,
                                    false, false),
                                OtpInput(_verifyOtpController.fieldThree, false,
                                    false, false),
                                OtpInput(_verifyOtpController.fieldFour, false,
                                    false, false),
                                OtpInput(_verifyOtpController.fieldFive, false,
                                    false, false),
                                OtpInput(_verifyOtpController.fieldSix, false,
                                    true, false)
                              ],
                            ),
                          )),
                        ),
                        U.addGap(20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60.sp),
                          child: CommanFormButton(
                            labelText: "Verfiy OTP",
                            isLoading: _verifyOtpController.isLoading.value,
                            enabled: !_verifyOtpController.isLoading.value,
                            loadingText: "Please wait",
                            callback: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              verifyOtp();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ])),
//form
        )));
  }

  Future<void> verifyOtp() async {
    String pin = _verifyOtpController.fieldOne.text.toString() +
        _verifyOtpController.fieldTwo.text.toString() +
        _verifyOtpController.fieldThree.text.toString() +
        _verifyOtpController.fieldFour.text.toString() +
        _verifyOtpController.fieldFive.text.toString() +
        _verifyOtpController.fieldSix.text.toString();

    if (pin.length != 6) {
      U.showToast(AppConstants.enterOtpValid);
      return;
    } else {}
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verifyOtpController.credentials,
        smsCode: pin,
      );
      User user;
      _verifyOtpController.isLoading.value = true;
      /*final AuthResult user =*/
      await _auth.signInWithCredential(credential).then((value) {
        print("signInWithCredential --------->");
        UserCredential cred=value;
        cred.user?.uid;
        Map data = {"user": value};
        Get.back(result: data);
        _verifyOtpController.isLoading.value = false;
      }).catchError((e) {
        _verifyOtpController.isLoading.value = false;
        print("catch error  ->>" + e.toString());
        U.showToast(e.message);
      });
      //final User currentUser = await _auth.currentUser;
      //print("user details --->" + user.user.uid);
      //   assert(user.uid == currentUser.uid);
      // Get.offAllNamed(Routes.dashBoard);
      //   Navigator.pushReplacementNamed(context, '/homeScreen');
    } catch (e) {
      _verifyOtpController.isLoading.value = false;
      print("ex-->" + e.toString());
      handleError(e as PlatformException);
    }
  }

  //Method for verify otp entered by user
  void handleError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context as BuildContext).requestFocus(FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        showAlertDialog(context as BuildContext, 'Invalid Code');
        break;
      default:
        showAlertDialog(context as BuildContext, error.message ?? "");
        break;
    }
  }

  //Basic alert dialogue for alert errors and confirmations
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
