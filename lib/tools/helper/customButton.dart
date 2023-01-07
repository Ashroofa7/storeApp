import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,
          this.height,
          this.width,
          this.name,
          this.Containercolor,
          this.Textcolor,
          this.radius,
          this.fontsize,
          this.fontweight,
     this.ontap,
   }) ;
   Color? Containercolor;
   Color? Textcolor;
   double? radius;
   double? width;
   double? height;
   String? name;
   Function()? ontap;
   double? fontsize;
   FontWeight? fontweight;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Containercolor,
          borderRadius: BorderRadius.circular(radius??0),
        ),
        width: width??double.infinity,
        height: height,
        child: Center(child: Text(name!,style: TextStyle(
          color: Textcolor,
          fontSize: fontsize,
          fontWeight: fontweight,
        ),),),
      ),
    );
  }
}
