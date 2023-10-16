import 'package:flutter/cupertino.dart';
import 'base_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BookingScreenController extends BaseController {

  var formKey3 = GlobalKey<FormState>();
  TextEditingController startDateController= TextEditingController();
  TextEditingController endDateController= TextEditingController();
  TextEditingController addressController= TextEditingController();

  var selectedOptiontrainer = 'withTrainer'.obs;
  var selectedOptionPay = 'cod'.obs;

  var selectedDogService = "".obs;
  var dropDownDogsSErvice = <String>["Army", "Sniffer", "Guide","Other"].obs;
  var dateData = <DateTime>[].obs;
  int totalDays = 34;
  var dateFormatDisplay = 'yyyy-MM-dd';
  var datetimeFormat = 'yyyy-MM-dd hh:mm:ss';
  var dateFormatBooking = 'dd/MM/yyyy HH:mm';
  var dayFormat = 'dd';
  var dayNameFormat = 'EEE';
  var dateFormat = 'dd/MM/yyyy';
  var timeFormat = 'HH:mm';
  var formatterDayName = DateFormat('EEE');
  var formatterDate = DateFormat('dd/MM/yyyy');
  var formatterDatePass = DateFormat('yyyy-MM-dd');
  var todayDate = DateTime.now();

//final StorageService storageService = StorageService();
}
