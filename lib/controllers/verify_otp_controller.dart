import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base_controller.dart';

class VerifyOtpMobileController extends BaseController {


  var formKey3 = GlobalKey<FormState>();
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();
  TextEditingController fieldFive = TextEditingController();
  TextEditingController fieldSix = TextEditingController();
  var credentials = "";
  var receivedMobilekey = "".obs;
  String isFromString = "";
  var contact = "";

  @override
  Future<void> onInit() async {
    try {
      credentials = await Get.arguments['credentials'].toString();
      contact = await Get.arguments['contact'].toString();
      isFromString = await Get.arguments['isfrom'].toString();
    } catch (e) {}
    ;
    if (contact != null && contact.isNotEmpty) {
      receivedMobilekey.value = contact;
    }


    super.onInit();
  }
}
