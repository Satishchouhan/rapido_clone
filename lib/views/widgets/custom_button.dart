import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapido_clone/utills/app_color.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
    CustomButton({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width:Get.width ,
      height: Get.height*0.07,
      child: TextButton(
      onPressed: onPressed.call(),
        child: Text(buttonText,style: TextStyle(color: AppColor.black,fontSize: 14,fontWeight: FontWeight.normal),),
      ),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
