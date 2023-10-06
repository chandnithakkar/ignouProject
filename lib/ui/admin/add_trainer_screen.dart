import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/add_trainer_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/common_form_button.dart';
import '../../utils/common_textfield.dart';
import '../../utils/font_styles.dart';
import '../../utils/utils.dart';

class AddTrainerScreen extends StatefulWidget {
  AddTrainerScreen({Key? key}) : super(key: key);

  @override
  State<AddTrainerScreen> createState() => _AddTrainerScreenState();
}

class _AddTrainerScreenState extends State<AddTrainerScreen> {

  final AddTrainerController addTrainerController = Get.put((AddTrainerController()));

  final databaseReference = FirebaseDatabase.instance.ref('trainer');
  String errorMessage = '';

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
                key: addTrainerController.formKeyTrainer,
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
                            "Add Trainer",
                            style: St.RegulareNoteText(35.sp),
                            textAlign: TextAlign.center,
                          ),
                          U.addVerBox(size: 20),
                          GetTextFormField(
                            isObscureText: false,
                            hintText: "Enter Trainer name ",
                            labelText: "Trainer name",
                            controller: addTrainerController.trainerNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorBreed;
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
                            hintText: "Enter Trainer Specialization",
                            labelText: "Trainer Specialization",
                            controller: addTrainerController.trainerSpecializationController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorTrainerSpecialization;
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
                            hintText: "Enter Trainer Details",
                            labelText: "Trainer Details",
                            controller: addTrainerController.trainerDetailsController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorTrainerDetails;
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
                            hintText: "Enter Trainer Achievements",
                            labelText: "Trainer Achievements",
                            controller: addTrainerController.trainerAchievementsController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return AppConstants.errorTrainerAchievements;
                                }
                              }
                              /*  if (!Utils.isEmail(value.toString())) {
                                return AppConstants.validEmail;
                              }
*/
                              return null;
                            },
                          ) ,
                          U.addVerBox(size: 20),
                          GetTextFormField(
                            isObscureText: false,
                            hintText: "Enter Trainer Experience in years",
                            labelText: "Trainer Achievements",
                            controller: addTrainerController.trainerExperienceController,
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60.sp),
                            child: CommanFormButton(
                              labelText: "Save",
                              isLoading: addTrainerController.isLoading.value,
                              enabled: !addTrainerController.isLoading.value,
                              loadingText: "Please wait",
                              callback: () async {
                                FocusManager.instance.primaryFocus?.unfocus();

                                // Create a map of dog details
                                Map<String, dynamic> dogDetails = {
                                  "trainerName":
                                      addTrainerController.trainerNameController.text,
                                  "trainerSpecialization":
                                      addTrainerController.trainerSpecializationController.text,
                                  "trainerDetails":
                                      addTrainerController.trainerDetailsController.text,
                                  "trainerAchievements": addTrainerController
                                      .trainerAchievementsController.text,
                                  "trainerExperience": addTrainerController
                                      .trainerExperienceController.text,
                                  "trainerId": "",
                                  // You can set this if you have a way to get the trainer ID
                                };
                                try {
                                  // Push the dog details to the Firebase Realtime Database
                                  await databaseReference
                                      .push()
                                      .set(dogDetails);
                                  U.showToast("Trainer details added successfully");
                                } catch (e) {
                                  U.showToast("Error adding trainer details: $e");
                                }
                              },
                            ),
                          ),
                          U.addVerBox(size: 20),
                        ],
                      ),
                    ))))));
/*
    });
*/
  }
}
