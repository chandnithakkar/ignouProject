import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_styles.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isFrst;
  final bool isLast;

  final bool pwdText;

  OtpInput(this.controller, this.isFrst, this.isLast, this.pwdText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.sp,
      width: 45.sp,
      child: TextField(
        autofocus: false,
        textAlign: TextAlign.center,
        obscureText: pwdText,
        obscuringCharacter: "*",
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        showCursor: false,
        textInputAction: TextInputAction.next,
        style: St.RegulareNoteText(18.sp),
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 10.0)),
        onChanged: (value) {
          if (value.length == 1 && isLast == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && isFrst == false) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
