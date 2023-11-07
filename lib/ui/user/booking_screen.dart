import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ignou_project/utils/app_constants.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../controllers/booking_screen_controller.dart';
import '../../model/dog.dart';
import '../../route/app_pages.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
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
  final databaseReference = FirebaseDatabase.instance.ref('orders');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool isCardFlipped = false;

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
                                      : U.convertiEnDateEtHeure1(bookingController.startDateController.text);

                                  DateTime? endDate = bookingController.endDateController.text.isEmpty
                                      ? null
                                      : U.convertiEnDateEtHeure1(bookingController.endDateController.text);

                                  if (bookingController
                                          .startDateController.text ==
                                      "") {
                                    U.showToast("Please select start date");
                                  } else if (bookingController
                                          .endDateController.text ==
                                      "") {
                                    U.showToast("Please select end date");
                                  } else if (endDate!.isBefore(startDate!)) {
                                      U.showToast(
                                          "End date must be after the start date.");
                                  }else if(endDate.isAtSameMomentAs(startDate)){
                                    U.showToast(
                                        "End date must be after the start date.");
                                  }
                                  else if(bookingController.addressController.text==""){
                                    U.showToast("Please enter address.");
                                  }
                                  else{
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    int numberOfDays = 0;
                                    Duration difference = endDate.difference(startDate);
                                    numberOfDays = difference.inDays;

                                   int  price= numberOfDays* (bookingController.selectedOptiontrainer.value=="withTrainer"? int.parse(widget.dog!.dogPriceWTrainer??"0"):int.parse(widget.dog?.dogPriceWoutTrainer??"0"));

                                    FocusManager.instance.primaryFocus?.unfocus();
                                    final uuid = Uuid();
                                    final orderID = uuid.v4();
                                    var userID=await bookingController.storageService.getString(AppConstants.uidPref);
                                    // Create a map of dog details
                                    Map<String, dynamic> orderDetails = {
                                      "orderID":orderID,
                                      "userID":"${userID}",//currently static
                                      "dogID":widget.dog?.dogID,
                                      "startDate":bookingController.startDateController.text,
                                      "endDate":bookingController.endDateController.text,
                                        "payMode":bookingController.selectedOptionPay.value,
                                      "withWithoutTrainer":bookingController.selectedOptiontrainer.value,
                                      "address":bookingController.addressController.text,
                                      "price":price,
                                    };
                                    try {
                                      // Push the dog details to the Firebase Realtime Database
                                     // await databaseReference.push().set(orderDetails);
                                      showModalBottomSheet(context: context,
                                          shape:RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0)),
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20), color: Colors.white),
                                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                U.addGap(20),
                                                Center(child: Text("Summary",style: St.textFontRegular(color: CC.black,size: 22.sp,weight: FontWeight.w500),)),
                                                U.addGap(30),
                                                Text("Start Date : ${bookingController.startDateController.text}",style: St.textFontRegular(color: CC.black,size: 16.sp,weight: FontWeight.w500),),
                                                U.addGap(10),
                                                Text("End Date : ${bookingController.endDateController.text}",style: St.textFontRegular(color: CC.black,size: 16.sp,weight: FontWeight.w500),),
                                                U.addGap(10),
                                                Text("PayMode : ${bookingController.selectedOptionPay.value}",style: St.textFontRegular(color: CC.black,size: 16.sp,weight: FontWeight.w500),),
                                                U.addGap(10),
                                                Text("Address : ${bookingController.addressController.text}",style: St.textFontRegular(color: CC.black,size: 16.sp,weight: FontWeight.w500),),
                                                U.addGap(10),
                                                Text("Dog name : ${widget.dog?.dogName}",style: St.textFontRegular(color: CC.black,size: 16.sp,weight: FontWeight.w500),),
                                                U.addGap(10),
                                                Text("Dog breed : ${widget.dog?.dogBreed}",style: St.textFontRegular(color: CC.black,size: 16.sp,weight: FontWeight.w500),),
                                                U.addGap(10),
                                                Text("Price : ${price}",style: St.textFontRegular(color: CC.black,size: 16.sp,weight: FontWeight.w500),),
                                                U.addGap(10),
                                                    CommanFormButton(
                                                        labelText: "Checkout",
                                                        isLoading:
                                                            bookingController.isLoading.value,
                                                        enabled:
                                                            !bookingController.isLoading.value,
                                                        loadingText: "Please wait",
                                                        callback: () async {
                                                          if(bookingController.selectedOptionPay.value=="cod"){
                                                            //Navigator.pop(context);
                                                            Navigator.of(context).pop();
                                                            showDialog(
                                                                context: context,
                                                                barrierDismissible: true,
                                                                builder: (BuildContext context) =>
                                                                Dialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)),
                                                              child: Container(
                                                                height: 350.sp,
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                                                  color: Colors.white,

                                                                ),
                                                                padding: EdgeInsets.symmetric(horizontal: 20),
                                                                child: Column(
                                                                  children: [
                                                                    Image.asset(AppIcons.orderSuccess,width: 200.sp,height: 200.sp,),
                                                                    U.addGap(10),
                                                                    Text("Order placed successfully",style: St.textFontRegular(color: CC.black,size: 16.sp,weight: FontWeight.w500),),
                                                                    U.addGap(10),
                                                                    CommanFormButton(
                                                                        labelText: "Close",
                                                                        isLoading: false,
                                                                        enabled: true,
                                                                        loadingText: "Please wait",
                                                                            callback:
                                                                                () async {
                                                                                  await databaseReference.push().set(orderDetails);
                                                                              Navigator.of(context).pop();

                                                                              Get.offAllNamed(Routes.UserDashboard);
                                                                            })
                                                                      ],
                                                                ),
                                                              ),
                                                            ));
                                                          }else{
                                                            Navigator.of(context).pop();

                                                            showModalBottomSheet(
                                                                context: context,
                                                                shape:RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(12.0)),
                                                                builder: (BuildContextcontext) {
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        color: Colors
                                                                            .white),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .all(
                                                                          16.0),
                                                                      child:
                                                                          Form(
                                                                        key:
                                                                            _formKey,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            AnimatedContainer(
                                                                              duration: Duration(seconds: 1),
                                                                              // Add animation duration
                                                                              curve: Curves.easeInOut,
                                                                              // Add animation curve
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  begin: Alignment.topLeft,
                                                                                  end: Alignment.bottomRight,
                                                                                  colors: [
                                                                                    CC.primaryColor,
                                                                                    CC.secondaryColor,
                                                                                    CC.thirdColor
                                                                                  ],
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    color: Colors.grey.withOpacity(0.5),
                                                                                    spreadRadius: 1,
                                                                                    blurRadius: 5,
                                                                                    offset: Offset(0, 2),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(16.0),
                                                                                child: Column(
                                                                                  children: [
                                                                                    Text(
                                                                                      'Card Information',
                                                                                      style: TextStyle(
                                                                                        fontSize: 20,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        color: Colors.white, // Text color
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 20),
                                                                                    TextFormField(
                                                                                      controller: _cardNumberController,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Card Number',
                                                                                        hintText: 'XXXX XXXX XXXX XXXX',
                                                                                        labelStyle: TextStyle(color: Colors.white), // Label text color
                                                                                      ),
                                                                                      validator: (value) {
                                                                                        if (value == null || value.isEmpty) {
                                                                                          return 'Card number is required';
                                                                                        }
                                                                                        return null;
                                                                                      },
                                                                                    ),
                                                                                    SizedBox(height: 20),
                                                                                    Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: TextFormField(
                                                                                            controller: _expirationDateController,
                                                                                            decoration: InputDecoration(
                                                                                              labelText: 'Expiration Date',
                                                                                              hintText: 'MM/YY',
                                                                                              labelStyle: TextStyle(color: Colors.white), // Label text color
                                                                                            ),
                                                                                            validator: (value) {
                                                                                              if (value == null || value.isEmpty) {
                                                                                                return 'Expiration date is required';
                                                                                              }
                                                                                              return null;
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(width: 16),
                                                                                        Expanded(
                                                                                          child: TextFormField(
                                                                                            controller: _cvvController,
                                                                                            decoration: InputDecoration(
                                                                                              labelText: 'CVV',
                                                                                              hintText: 'XXX',
                                                                                              labelStyle: TextStyle(color: Colors.white), // Label text color
                                                                                            ),
                                                                                            validator: (value) {
                                                                                              if (value == null || value.isEmpty) {
                                                                                                return 'CVV is required';
                                                                                              }
                                                                                              return null;
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 20),
                                                                            U.addGap(20),
                                                                            Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 60.sp),
                                                                              child: CommanFormButton(
                                                                                labelText: "Make payment",
                                                                                isLoading: false,
                                                                                enabled: true,
                                                                                loadingText: "Please wait",
                                                                                callback: () async {
                                                                                  if (_formKey.currentState!.validate()) {
                                                                                    await databaseReference.push().set(orderDetails);

                                                                                    // Handle payment processing here
                                                                                    // Display a success message or navigate to the next screen
                                                                                    U.showToast("Payment successful!");
                                                                                  }
                                                                                },
                                                                              ),
                                                                            ),
                                                                            /* ElevatedButton(
                                                                                                  onPressed: () {
                                                                                                    if (_formKey.currentState!.validate()) {
                                                                                                      // Handle payment processing here
                                                                                                      // Display a success message or navigate to the next screen
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text('Payment successful!'),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                  },
                                                                                                  child: Text('Make Payment'),
                                                                                                ),*/
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                            //                                                        Get.toNamed(Routes.paymentScreen);
                                                          }

                                                        })
                                                  ],
                                            )
                                            );
                                          }
                                      );

                                    } catch (e) {
                                      U.showToast("Error adding order: $e");
                                    }



                                    //Get.toNamed(Routes.paymentScreen);
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
