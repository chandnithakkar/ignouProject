import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ignou_project/utils/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class GetTextFormField extends StatelessWidget {
  GetTextFormField({
    Key? key,
    this.controller,
    this.ontap,
    this.labelText,
    required this.validator,
    this.enableInteractiveSelection,
    this.hintText,
    this.callback,
    this.length,
    required this.isObscureText,
    this.passwordButton,
    this.inputType,
    this.enabled,
    this.inputFormatters,
    this.autovalidateMode,
    this.onChanged,
    this.readMode,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final int? length;
  final String? Function(String?)? validator;
  final VoidCallback? callback;
  final bool isObscureText;
  final String? hintText;
  final Widget? passwordButton;
  final TextInputType? inputType;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Function? ontap;
  final FocusNode? focusNode;
  bool? enabled = true;
  bool? enableInteractiveSelection = true;
  final bool? readMode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      controller: controller,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLength: length,
      onTap: ontap as void Function()?,
      validator: validator,
      obscureText: isObscureText,
      enabled: enabled ?? true,
      focusNode: focusNode,
      style: St.RegulareNoteText(16.0),
      cursorColor: Colors.grey,
      keyboardType: inputType,
      readOnly: readMode ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: passwordButton,
        labelText: labelText,
        labelStyle: St.textFontRegular(size: 16.0.sp),
        floatingLabelStyle: St.TextBoxFlotingLableStyle(16.0),
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.sp,
          horizontal: 16.sp,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: CC.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        hintStyle: St.TextBoxHintStyle(16.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: CC.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: CC.borderColor),
        ),
      ),
    );
  }
}

class getenabledTextFormField extends StatelessWidget {
  getenabledTextFormField(
      {Key? key,
      this.controller,
      this.ontap,
      this.labelText,
      required this.validator,
      this.enableInteractiveSelection,
      this.hintText,
      this.callback,
      this.length,
      required this.isObscureText,
      this.passwordButton,
      this.inputType,
      this.enabled,
      this.inputFormatters,
      this.autovalidateMode,
      this.onChanged,
      this.readMode,
      this.focusNode})
      : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final int? length;
  final String? Function(String?)? validator;
  final VoidCallback? callback;
  final bool isObscureText;
  final String? hintText;
  final Widget? passwordButton;
  final TextInputType? inputType;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? ontap;
  final FocusNode? focusNode;
  bool? enabled = true;
  bool? enableInteractiveSelection = true;
  bool? readMode = false;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      controller: controller,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLength: length,
      onTap: ontap,
      validator: validator,
      obscureText: isObscureText,
      enabled: enabled,
      focusNode: focusNode,
      style: St.midContrassText(value: 16.0),
      cursorColor: Colors.grey,
      keyboardType: inputType,
      readOnly: readMode ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: passwordButton,
        labelText: labelText,
        labelStyle: St.TextBoxLableStyle(16.0),
        // floatingLabelStyle: Styles.TextBoxFlotingLableStyle(16.0),
        contentPadding:
            EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: CC.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        hintStyle: St.TextBoxHintStyle(16.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: CC.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: CC.borderColor),
        ),
      ),
    );
  }
}

class GetAdderssTextFormField extends StatelessWidget {
  GetAdderssTextFormField({
    Key? key,
    this.controller,
    this.ontap,
    this.labelText,
    required this.validator,
    this.enableInteractiveSelection,
    this.hintText,
    this.callback,
    this.length,
    required this.isObscureText,
    this.passwordButton,
    this.inputType,
    this.enabled,
    this.inputFormatters,
    this.autovalidateMode,
    this.onChanged,
    this.readMode,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final int? length;
  final String? Function(String?)? validator;
  final VoidCallback? callback;
  final bool isObscureText;
  final String? hintText;
  final Widget? passwordButton;
  final TextInputType? inputType;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Function? ontap;
  final FocusNode? focusNode;
  bool? enabled = true;
  bool? enableInteractiveSelection = true;
  final bool? readMode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      controller: controller,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLength: length,
      textInputAction: TextInputAction.newline,
      onTap: ontap as void Function()?,
      validator: validator,
      obscureText: isObscureText,
      enabled: enabled ?? true,
      focusNode: focusNode,
      maxLines: 3,
      style: St.RegulareNoteText(16.0),
      cursorColor: Colors.grey,
      keyboardType: inputType,
      readOnly: readMode ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: passwordButton,
        labelText: labelText,
        labelStyle: St.textFontRegular(size: 16.0.sp),
        floatingLabelStyle: St.TextBoxFlotingLableStyle(16.0),
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.sp,
          horizontal: 16.sp,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: CC.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        hintStyle: St.TextBoxHintStyle(16.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: CC.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: CC.borderColor),
        ),
      ),
    );
  }
}
