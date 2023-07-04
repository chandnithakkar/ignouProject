import 'package:flutter/material.dart';
import 'package:ignou_project/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_styles.dart';

class CommanFormButton extends StatelessWidget {
  CommanFormButton(
      {Key? key,
      required this.labelText,
      required this.isLoading,
      required this.loadingText,
      required this.enabled,
      required this.callback})
      : super(key: key);
  final String? labelText;
  bool enabled = true;
  bool isLoading = false;
  final String loadingText;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          if (enabled) {
            callback();
          } else {
            null;
          }
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [CC.primaryColor, CC.secondaryColor, CC.thirdColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 500.0, minHeight: 40.sp),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          loadingText,
                          style: St.ButtonLoadingTextStyle(16.sp),
                        ),
                        U.addHorBox(),
                        SizedBox(
                          height: 16.sp,
                          width: 16.sp,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.sp,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      labelText ?? "",
                      textAlign: TextAlign.center,
                      style: St.ButtonTextStyle(18.sp),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
