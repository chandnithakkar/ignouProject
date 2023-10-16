import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_form_button.dart';
import '../../utils/font_styles.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool isCardFlipped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CC.white,
        centerTitle: true,
        title: Text(
          "Payment",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1), // Add animation duration
                curve: Curves.easeInOut, // Add animation curve
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
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
                      // Handle payment processing here
                      // Display a success message or navigate to the next screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Payment successful!'),
                        ),
                      );
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
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expirationDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}
