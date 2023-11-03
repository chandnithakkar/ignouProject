import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/booking_screen_controller.dart';
import '../../model/dog.dart';
import '../../route/app_pages.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_form_button.dart';
import '../../utils/common_textfield.dart';
import '../../utils/font_styles.dart';
import '../../utils/utils.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({Key? key, this.dog}) : super(key: key);
  final Dog? dog;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final BookingScreenController bookingController =
      Get.put((BookingScreenController()));

  @override
  Widget build(BuildContext context) {
    var width = U.getScreenWidth(context);
    var height = U.getScreenHeight(context);

/*    return Obx(() {*/
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CC.white,
          centerTitle: true,
          title: Text(
            "Book Service",
            style: St.RegulareNoteText(15.sp),
            textAlign: TextAlign.center,
          ),
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back_ios,
              color: CC.gradient_second,
            ),
            onTap: () {
              Get.back();
            },
          ),
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
                child: SafeArea(
                    child: SingleChildScrollView(
                  child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            U.addGap(20),
                            GestureDetector(
                              onTap: () async {
                                await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: CC.primaryColor,
                                            // <-- SEE HERE
                                            onPrimary: CC.white,
                                            // <-- SEE HERE
                                            onSurface:
                                                CC.primaryColor, // <-- SEE HERE
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary: CC
                                                  .primaryColor, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    }).then((value) {
                                  var convDate = U.convertiEnDateEtHeure(value);
                                  bookingController.startDateController.text =
                                      convDate;
                                  // _uploadBioDobController.dobController.text = convDate;
                                  print(convDate);
                                  //   _uploadBioDobController.dobController.text = TextEditingValue(text: formatter.format(value)).toString();
                                });
                              },
                              child: getenabledTextFormField(
                                isObscureText: false,
                                hintText: " Enter Start Date",
                                enableInteractiveSelection: false,
                                enabled: false,
                                passwordButton: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.calendar_month,
                                    size: 10.sp,
                                  ),
                                ),
                                controller:
                                    bookingController.startDateController,
                                labelText: "Start Date",
                                autovalidateMode: AutovalidateMode.disabled,
                                validator: (String) {},
                              ),
                            ),
                            U.addGap(20),
                            GestureDetector(
                              onTap: () async {
                                await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: CC.primaryColor,
                                            // <-- SEE HERE
                                            onPrimary: CC.white,
                                            // <-- SEE HERE
                                            onSurface:
                                                CC.primaryColor, // <-- SEE HERE
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary: CC
                                                  .primaryColor, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    }).then((value) {
                                  DateFormat formatter = DateFormat(
                                      'dd/MM/yyyy'); //specifies day/month/year format
                                  //print(value);
                                  var convDate = U.convertiEnDateEtHeure(value);
                                  bookingController.endDateController.text =
                                      convDate;
                                  // _uploadBioDobController.dobController.text = convDate;
                                  print(convDate);
                                  //   _uploadBioDobController.dobController.text = TextEditingValue(text: formatter.format(value)).toString();
                                });
                              },
                              child: getenabledTextFormField(
                                isObscureText: false,
                                hintText: " Enter End Date",
                                enableInteractiveSelection: false,
                                enabled: false,
                                passwordButton: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.calendar_month,
                                    size: 10.sp,
                                  ),
                                ),
                                controller: bookingController.endDateController,
                                labelText: "End Date",
                                autovalidateMode: AutovalidateMode.disabled,
                                validator: (String) {},
                              ),
                            ),
                            U.addGap(20),
                            Text(
                              "Please select how you want to book dog",
                              style: St.textFontRegular(
                                size: 14.sp,
                              ),
                            ),
                            U.addGap(10),
                            RadioListTile(
                              title: Text('With Trainer'),
                              value: 'withTrainer',
                              groupValue:
                                  bookingController.selectedOptiontrainer.value,
                              activeColor: CC.primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  bookingController
                                      .selectedOptiontrainer.value = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('Without Trainer'),
                              value: 'withoutTrainer',
                              activeColor: CC.primaryColor,
                              groupValue:
                                  bookingController.selectedOptiontrainer.value,
                              onChanged: (value) {
                                setState(() {
                                  bookingController
                                      .selectedOptiontrainer.value = value!;
                                });
                              },
                            ),
                            U.addGap(20),
                            GetAdderssTextFormField(
                              isObscureText: false,
                              hintText: " Enter Your Address",
                              enableInteractiveSelection: false,
                              inputType: TextInputType.streetAddress,
                              controller: bookingController.addressController,
                              labelText: "Address",
                              autovalidateMode: AutovalidateMode.disabled,
                              validator: (String) {},
                            ),
                            U.addGap(20),
                            Text(
                              "Please select the payment type",
                              style: St.textFontRegular(
                                size: 14.sp,
                              ),
                            ),
                            U.addGap(10),
                            RadioListTile(
                              title: Text('COD'),
                              value: 'cod',
                              groupValue:
                                  bookingController.selectedOptionPay.value,
                              activeColor: CC.primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  bookingController.selectedOptionPay.value =
                                      value!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('Debit/Credit card'),
                              value: 'card',
                              activeColor: CC.primaryColor,
                              groupValue:
                                  bookingController.selectedOptionPay.value,
                              onChanged: (value) {
                                setState(() {
                                  bookingController.selectedOptionPay.value =
                                      value!;
                                });
                              },
                            ),
                            U.addGap(20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 60.sp),
                              child: CommanFormButton(
                                labelText: "Proceed",
                                isLoading: bookingController.isLoading.value,
                                enabled: !bookingController.isLoading.value,
                                loadingText: "Please wait",
                                callback: () async {
                                  DateTime? startDate = bookingController
                                          .startDateController.text.isEmpty
                                      ? null
                                      : U.convertiEnDateEtHeure1(
                                          bookingController
                                              .startDateController.text);

                                  DateTime? endDate = bookingController
                                          .endDateController.text.isEmpty
                                      ? null
                                      : U.convertiEnDateEtHeure1(
                                          bookingController
                                              .endDateController.text);

                                  if (bookingController
                                          .startDateController.text ==
                                      "") {
                                    U.showToast("Please select start date");
                                  } else if (bookingController
                                          .endDateController.text ==
                                      "") {
                                    U.showToast("Please select end date");
                                  } else if (startDate == null ||
                                      endDate == null) {
                                    if (endDate!.isBefore(startDate!) ||
                                        endDate.isAtSameMomentAs(startDate)) {
                                      U.showToast(
                                          "End date must be after the start date.");
                                    }
                                  }
                                  else if(bookingController.addressController.text==""){
                                    U.showToast("Please enter address.");
                                  }
                                  else{
                                    Get.toNamed(Routes.paymentScreen);
                                  }

                                },
                              ),
                            ),
                            U.addVerBox(size: 20),
                          ])),
                )))));
    /* });*/
  }
}
