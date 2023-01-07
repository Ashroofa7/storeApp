import 'package:flutter/material.dart';

class CustomCartButoon extends StatelessWidget {
  CustomCartButoon({super.key,
    this.height,
    this.width,
    this.name,
    this.Containercolor,
    this.Textcolor,
    this.radius,
    this.fontsize,
    this.fontweight,
    this.ontap,
    this.iconData,
    this.color,
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
  IconData? iconData;
  Color? color;


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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(iconData,color: color,),
              Text(name!,style: TextStyle(
                  color: Textcolor,
                  fontSize: fontsize,
                  fontWeight: fontweight,
                ),),

            ],
          ),
        ),
      ),
    );
  }
}
