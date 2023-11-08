import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ignou_project/ui/user/booking_screen.dart';
import 'package:ignou_project/utils/app_icons.dart';
import '../../controllers/add_dog_controlller.dart';
import '../../model/dog.dart';
import '../../model/trainer.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_form_button.dart';
import '../../utils/font_styles.dart';
import '../../utils/utils.dart';

class TrainerDetailsScreen extends StatefulWidget {
  TrainerDetailsScreen({Key? key, this.trainer}) : super(key: key);
  final Trainer? trainer;

  @override
  State<TrainerDetailsScreen> createState() => _TrainerDetailsScreenState();
}

class _TrainerDetailsScreenState extends State<TrainerDetailsScreen> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: CC.white,
            centerTitle: true,
            title: Text(
              "Trainer Details",
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                                  child: Image.asset(AppIcons.trainer,
                                      height:
                                      MediaQuery.of(context).size.height / 4,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width),
                                )),
                            U.addGap(20),
                            Text(
                              "${widget.trainer?.trainerName ?? ""}",
                              style: St.RegulareNoteText(35.sp),
                              maxLines: 5 ,
                              textAlign: TextAlign.center,
                            ),
                            U.addGap(20),
                           /* Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Trainer ID: ",
                                  style: St.textFontBold(size: 14.sp),
                                ),
                                Text(
                                  "${widget.trainer?.trainerId ?? ""}",
                                  style: St.RegulareNoteText(14.sp),
                                ),
                              ],
                            ),
                            U.addGap(20),*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Trainer specialization: ",
                                  style: St.textFontBold(size: 14.sp),
                                ),
                                Expanded(
                                  child: Text(
                                    "${widget.trainer?.trainerSpecialization ?? ""}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: St.RegulareNoteText(14.sp),
                                  ),
                                ),
                              ],
                            ),
                            U.addGap(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Trainer's experience: ",
                                  style: St.textFontBold(size: 14.sp),
                                ),
                                Expanded(
                                  child: Text(
                                    "${widget.trainer?.trainerExperience?? ""}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: St.RegulareNoteText(14.sp),
                                  ),
                                ),
                              ],
                            ),
                            U.addGap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Trainer achievements : ",
                                  style: St.textFontBold(size: 14.sp),
                                ),
                                Expanded(
                                  child: Text(
                                    "${widget.trainer?.trainerAchievements ?? ""}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: St.RegulareNoteText(14.sp),
                                  ),
                                ),
                              ],
                            ),
                            U.addGap(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Trainer details : ",
                                  style: St.textFontBold(size: 14.sp),
                                ),
                                Expanded(
                                  child: Text(
                                    "${widget.trainer?.trainerDetails ?? ""}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: St.RegulareNoteText(14.sp),
                                  ),
                                ),
                              ],
                            ),
                            U.addGap(20),
                          ],
                        ),
                      )))));

  }
}
