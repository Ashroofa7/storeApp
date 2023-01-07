
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hint,
    this.labelText,
    this.hintColor,
    this.borderSideColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.cursorColor,
    this.textColor,
    this.preicon,
    this.suficon,
    this.suffixpressed,
    this.prefixpressed,
    this.presize,
    this.sufsize,
    this.onchanged,
    this.valid,
    this.radius,
    this.type,
    this.controller,
  });
  String? hint;
  String? labelText;
  Color? hintColor;
  Color? borderSideColor;
  Color? enabledBorderColor;
  Color? focusedBorderColor;
  Color? disabledBorderColor;
  Color? cursorColor;
  Color? textColor;
  IconData? preicon;
  IconData? suficon;
  Function()? suffixpressed;
  Function()? prefixpressed;
  double? presize;
  double? sufsize;
  double? radius;
  TextEditingController? controller;
  Function(String)? onchanged;
  String? Function(String?)? valid;
  TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: type,
      decoration: InputDecoration(

        alignLabelWithHint: true,
        //Outlineborder color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius??0),
          borderSide: BorderSide(
            color: borderSideColor ?? Colors.black,
          ),
        ),
        // enable bordercolor
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius??0),
          borderSide: BorderSide(
            color: enabledBorderColor ?? Colors.black,
          ),
        ),
        //focused border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius??0),
          borderSide: BorderSide(
            color: focusedBorderColor ?? Colors.blue.shade900,
          ),
        ),
        //disabled border
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius??0),
          borderSide: BorderSide(
            color: disabledBorderColor ?? Colors.black,
          ),
        ),
       //contentPadding: EdgeInsets.symmetric(v),
       // prefixIcon: Icon(preicon,color: Colors.white,),
        suffixIcon: Icon(suficon ,),
       //  suffix: IconButton(
       //    iconSize : sufsize??5 ,
       //    padding: EdgeInsetsDirectional.zero,
       //    onPressed: suffixpressed,
       //    icon: Icon(
       //      suficon,
       //    ),
       //  ),
        // prefix: IconButton(
        //   onPressed: prefixpressed,
        //   icon: Icon(
        //     preicon,
        //     size: presize,
        //   ),
        // ),
        hintText: hint,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        labelText: labelText,
      ),
      validator:valid,
      cursorColor: cursorColor,
      style:  TextStyle(
        color: textColor,
      ),
    );
  }
}
