import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ignou_project/ui/user/booking_screen.dart';
import 'package:ignou_project/utils/app_icons.dart';
import '../../controllers/add_dog_controlller.dart';
import '../../model/dog.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_form_button.dart';
import '../../utils/font_styles.dart';
import '../../utils/utils.dart';

class DogDetailsScreen extends StatefulWidget {
  DogDetailsScreen({Key? key, this.dog}) : super(key: key);
  final Dog? dog;

  @override
  State<DogDetailsScreen> createState() => _DogDetailsScreenState();
}

class _DogDetailsScreenState extends State<DogDetailsScreen> {
  final AddDogController addDogController = Get.put((AddDogController()));

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: CC.white,
            centerTitle: true,
            title: Text(
              "${widget.dog?.dogName ?? ""}",
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
                        Material(
                            elevation: 4,
                            // You can adjust the elevation as needed
                            borderRadius: BorderRadius.circular(16.0),
                            // Adjust the radius for rounded corners
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(AppIcons.lab,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width),
                            )),
                        U.addGap(20),
                        Text(
                          "${widget.dog?.dogName ?? ""}",
                          style: St.RegulareNoteText(35.sp),
                          textAlign: TextAlign.center,
                        ),
                        U.addGap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Breed : ",
                              style: St.textFontBold(size: 14.sp),
                            ),
                            Text(
                              "${widget.dog?.dogBreed ?? ""}",
                              style: St.RegulareNoteText(14.sp),
                            ),
                          ],
                        ),
                        U.addGap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Dog's age : ",
                              style: St.textFontBold(size: 14.sp),
                            ),
                            Text(
                              "${widget.dog?.dogAge ?? ""}",
                              style: St.RegulareNoteText(14.sp),
                            ),
                          ],
                        ),
                        U.addGap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Dog's achievements : ",
                              style: St.textFontBold(size: 14.sp),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.dog?.dogAchievements ?? ""}",
                                style: St.RegulareNoteText(14.sp),
                              ),
                            ),
                          ],
                        ),
                        U.addGap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Dog's price with trainer : ",
                              style: St.textFontBold(size: 14.sp),
                            ),
                            Text(
                              "${widget.dog?.dogPriceWTrainer ?? ""}",
                              style: St.RegulareNoteText(14.sp),
                            ),
                          ],
                        ),
                        U.addGap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Dog's price without trainer : ",
                              style: St.textFontBold(size: 14.sp),
                            ),
                            Text(
                              "${widget.dog?.dogPriceWoutTrainer ?? ""}",
                              style: St.RegulareNoteText(14.sp),
                            ),
                          ],
                        ),
                        U.addGap(20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60.sp),
                          child: CommanFormButton(
                            labelText: "Book Now  ",
                            isLoading: addDogController.isLoading.value,
                            enabled: !addDogController.isLoading.value,
                            loadingText: "Please wait",
                            callback: () async {
                              Get.to(()=> BookingScreen(dog: widget.dog,));
                            },
                          ),
                        ),
                        U.addVerBox(size: 20),
                      ],
                    ),
                  )))));
    });
  }
}
