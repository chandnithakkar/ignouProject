import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/add_dog_controlller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/common_form_button.dart';
import '../../utils/common_textfield.dart';
import '../../utils/font_styles.dart';
import '../../utils/utils.dart';
import 'package:uuid/uuid.dart';


class AddDogScreen extends StatefulWidget {
  AddDogScreen({Key? key}) : super(key: key);

  @override
  State<AddDogScreen> createState() => _AddDogScreenState();
}

class _AddDogScreenState extends State<AddDogScreen> {
  final AddDogController addDogController = Get.put((AddDogController()));
  String errorMessage = '';
  final databaseReference = FirebaseDatabase.instance.ref('dog');

  @override
  Widget build(BuildContext context) {
    return Obx(() {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
                key: addDogController.formKey3,
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
                            "Add Dog",
                            style: St.RegulareNoteText(35.sp),
                            textAlign: TextAlign.center,
                          ),
                        /*  U.addVerBox(size: 20),
                          GetTextFormField(
                            isObscureText: false,
                            hintText: "Enter Dog Breeed",
                            labelText: "Dog Breed",
                            controller: addDogController.dogBreedController,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorBreed;
                                }
                              }
                              *//*  if (!Utils.isEmail(value.toString())) {
                                return AppConstants.validEmail;
                              }
*//*
                              return null;
                            },
                          ),*/
                          U.addVerBox(size: 20),
                          GetTextFormField(
                            isObscureText: false,
                            hintText: "Enter Dog Name",
                            labelText: "Dog Name",
                            controller: addDogController.dogNameController,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorDogName;
                                }
                              }
                              /*  if (!Utils.isEmail(value.toString())) {
                                return AppConstants.validEmail;
                              }
*/
                              return null;
                            },
                          ),
                          U.addVerBox(size: 20),
                          GetTextFormField(
                            isObscureText: false,
                            hintText: "Enter Dog Age",
                            labelText: "Dog Age",
                            controller: addDogController.dogAgeController,
                            inputType: TextInputType.number,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorDogAge;
                                }
                              }
                              /*  if (!Utils.isEmail(value.toString())) {
                                return AppConstants.validEmail;
                              }
*/
                              return null;
                            },
                          ),
                          U.addVerBox(size: 20),
                          Container(
                              height: 54.sp,
                              padding: const EdgeInsets.only(right: 20.0),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:  CC.borderColor,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: DropdownButton(
                                isExpanded: true,
                                underline: Container(
                                  color: Colors.transparent,
                                ),
                                hint: Container(
                                  padding: EdgeInsets.only(left: 16.sp),
                                  child: Text("Select Dog Breed",
                                      style: St.RegulareNoteText(
                                          16.sp)),
                                ),
                                value: addDogController.selectedDogBreed.value == "" ? null : addDogController.selectedDogBreed.value,
                                items: addDogController.dropDownDogsList.value
                                    .map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.toString(),
                                        style: St.RegulareNoteText(
                                            16.sp)),
                                  );
                                }).toList(),
                                selectedItemBuilder: (BuildContext context) {
                                  return (addDogController.dropDownDogsList.value)
                                      .map<Widget>((item) {
                                    return Padding(
                                        padding: EdgeInsets.only(left:16.sp,top: 12.sp),
                                        child: Text(item,
                                            style: St.RegulareNoteText(
                                                16.sp)));
                                  }).toList();
                                },
                                onChanged: (val) {
                                  addDogController.selectedDogBreed.value = val.toString();
                                  print("selected value " + val.toString());
                                  //    _orderDetailsController.loadListApi();
                                },
                              )),
                          U.addVerBox(size: 20),
                          Container(
                              height: 54.sp,
                              padding: const EdgeInsets.only(right: 20.0),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:  CC.borderColor,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: DropdownButton(
                                isExpanded: true,
                                underline: Container(
                                  color: Colors.transparent,
                                ),
                                hint: Container(
                                  padding: EdgeInsets.only(left: 16.sp),
                                  child: Text("Select service",
                                      style: St.RegulareNoteText(
                                          16.sp)),
                                ),
                                value: addDogController.selectedDogService.value == "" ? null : addDogController.selectedDogService.value,
                                items: addDogController.dropDownDogsSErvice.value
                                    .map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.toString(),
                                        style: St.RegulareNoteText(
                                            16.sp)),
                                  );
                                }).toList(),
                                selectedItemBuilder: (BuildContext context) {
                                  return (addDogController.dropDownDogsSErvice.value)
                                      .map<Widget>((item) {
                                    return Padding(
                                        padding: EdgeInsets.only(left:16.sp,top: 12.sp),
                                        child: Text(item,
                                            style: St.RegulareNoteText(
                                                16.sp)));
                                  }).toList();
                                },
                                onChanged: (val) {
                                  addDogController.selectedDogService.value = val.toString();
                                  print("selected value " + val.toString());
                                  //    _orderDetailsController.loadListApi();
                                },
                              )),
                          U.addVerBox(size: 20),
                          GetTextFormField(
                            isObscureText: false,
                            hintText: "Enter Dog Achievements",
                            labelText: "Dog Achievements",
                            controller: addDogController.dogAchievementsController,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorDogAchievements;
                                }
                              }
                              /*  if (!Utils.isEmail(value.toString())) {
                                return AppConstants.validEmail;
                              }
*/
                              return null;
                            },
                          ),
                          U.addVerBox(size: 20),
                          GetTextFormField(
                            isObscureText: false,
                            hintText: "Enter Dog's price with Trainer",
                            labelText: "Dog's price with Trainer",
                            controller: addDogController.dogPriceWithController,
                            inputType: TextInputType.number,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorDogPRiceWithTrainer;
                                }
                              }
                              /*  if (!Utils.isEmail(value.toString())) {
                                return AppConstants.validEmail;
                              }
*/
                              return null;
                            },
                          ),
                          U.addVerBox(size: 20),
                          GetTextFormField(
                            isObscureText: false,
                            hintText: "Enter Dog's price without Trainer",
                            labelText: "Dog's price without Trainer",
                            controller: addDogController.dogPriceWithOutController,
                            inputType: TextInputType.number,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorDogPRiceWithoutTrainer;
                                }
                              }
                              /*  if (!Utils.isEmail(value.toString())) {
                                return AppConstants.validEmail;
                              }
*/
                              return null;
                            },
                          ),
                          U.addVerBox(size: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60.sp),
                            child: CommanFormButton(
                              labelText: "Save",
                              isLoading: addDogController.isLoading.value,
                              enabled: !addDogController.isLoading.value,
                                loadingText: "Please wait",
                              callback: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if(addDogController.dogNameController.text==""){
                                  U.showToast("Please enter dog's name");
                                }else if(addDogController.dogAgeController.text=="") {
                                  U.showToast("Please enter dog's age");
                                }else if(addDogController.selectedDogBreed.value=="") {
                                  U.showToast("Please select dog breed");
                                }else if(addDogController.selectedDogService.value=="") {
                                  U.showToast("Please select dog's service");
                                }else if(addDogController.dogAchievementsController.text=="") {
                                  U.showToast("Please enter dog's achievements");
                                }else if(addDogController.dogPriceWithController.text=="") {
                                  U.showToast("Please enter dog's price with trainer");
                                }else if(addDogController.dogPriceWithOutController.text=="") {
                                  U.showToast("Please enter dog's price without trainer");
                                }else{
                                  final uuid = Uuid();
                                  final dogId = uuid.v4();
                                  // Create a map of dog details
                                  Map<String, dynamic> dogDetails = {
                                    "dogID":dogId,
                                    "dogBreed": addDogController.selectedDogBreed.value,
                                    "dogServices": addDogController.selectedDogService.value,
                                    "dogName": addDogController.dogNameController.text,
                                    "dogAge": addDogController.dogAgeController.text,
                                    "dogAchievements": addDogController.dogAchievementsController.text,
                                    "dogPriceWTrainer": addDogController.dogPriceWithController.text,
                                    "dogPriceWoutTrainer": addDogController.dogPriceWithOutController.text,
                                    "trainerId": "", // You can set this if you have a way to get the trainer ID
                                  };
                                  try {
                                    // Push the dog details to the Firebase Realtime Database
                                    await databaseReference.push().set(dogDetails);
                                    U.showToast("Dog details added successfully");
                                    Get.back();
                                  } catch (e) {
                                    U.showToast("Error adding dog details: $e");
                                  }
                                }
                              },
                            ),
                          ),
                          U.addVerBox(size: 20),
                        ],
                      ),
                    ))))));
    });
  }
}
