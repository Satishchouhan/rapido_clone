import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapido_clone/utills/app_color.dart';
import 'package:rapido_clone/views/home_screen.dart';
import 'package:rapido_clone/views/widgets/custom_button.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(child: Image.asset("assets/image/logo.png",height: 100,)),
              SizedBox(
                height: 80,
              ),
              Center(child: Image.asset("assets/image/pilot_taxi.png",height: 130,)),
              SizedBox(
                height: 80,
              ),
              // CustomButton(onPressed: (){
              //  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              // }, buttonText: "Continue with Phone Number"),

          Container(
            margin: EdgeInsets.all(20),
            width:Get.width ,
            height: Get.height*0.07,
            child: TextButton(
              onPressed:  (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
              child: Text("Continue with Phone Number",style: TextStyle(color: AppColor.black,fontSize: 14,fontWeight: FontWeight.normal),),
            ),
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)
            ),
          ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    margin: EdgeInsets.all(2.0),
                    padding: EdgeInsets.only(left: 5.0,right: 5.0),
                    height: Get.height*0.07,
                    child: TextButton(onPressed:(){

                    },
                        child: Text("Google",style: TextStyle(color: AppColor.black,fontSize: 12),)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(2.0),
                    padding: EdgeInsets.only(left: 5.0,right: 5.0),
                    height: Get.height*0.07,
                      child: TextButton(onPressed:(){

                      },
                          child: Text("Facebook",style: TextStyle(color: AppColor.black,fontSize: 12),)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)
                    ),

                  )

                ],
              ),
              TextButton(onPressed: (){},
                  child:Text("By continuing, you agree to our Terms of Service and Privacy Policy.",textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.normal),

                  ))

            ],
          ),
        )
      ),
    );
  }
}
