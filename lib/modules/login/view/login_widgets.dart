import 'package:flutter/material.dart';

import '../../../../export.dart';
import '../../../utils/global_images.dart';

Widget login_main_widget(){
  return Container(
    color: Colors.grey.shade200,
    width: MediaQuery.of(Get.context!).size.width,
    height: MediaQuery.of(Get.context!).size.height,
    child: Column(
      children: [
        s1.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Icon(Icons.arrow_back_ios,color: Colors.black,size: 30,)
        ],),
        s4.heightBox,
        Container(
          width: MediaQuery.of(Get.context!).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              s2.heightBox,
              Image.asset(login_logo_png,width: 150,),
              s1.heightBox,
              Text("Log in",style: TextStyle(fontWeight: FontWeight.w500,fontSize: f3+2),),
              s3.heightBox,
              Obx(()=>
                Form(
                  key: login_controller_dat.formKey,
                  autovalidateMode: login_controller_dat.login_form_autovalidate_controller.value
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      login_email_widget(),
                      s2.heightBox,
                      login_password_widget(),
                    ],
                  ),
                ),
              ),
              s2.heightBox,
              login_proceed_btn_widget(),
              s4.heightBox,
            ],
          ),
        ),
        s3.heightBox,
        RichText(text: TextSpan(style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
        children: [
          TextSpan(text: "Do not have an account? "),
          TextSpan(text: "Sign up",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500))
        ]))
      ],
    ).p(20),
  );
}



Widget login_email_widget(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Email",style: TextStyle(fontWeight: FontWeight.w600,fontSize: f1)),
      5.heightBox,
      TextFormField(
        focusNode: login_controller_dat.emailFocusNode,
        controller: login_controller_dat.login_email_controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email_outlined),
            filled: true,
            fillColor: (login_controller_dat.emailFocusNode!.hasFocus)?Colors.white:Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide.none
            )
          ),
        )
    ],
  ).paddingSymmetric(horizontal: 20);
}

Widget login_password_widget(){
  return Obx(()=>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password",style: TextStyle(fontWeight: FontWeight.w600,fontSize: f1)),
        5.heightBox,
        TextFormField(
          focusNode: login_controller_dat.passwordFocusNode,
          controller: login_controller_dat.login_password_controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'password',
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: Icon((login_controller_dat.login_password_visibility_controller.value == true)?Icons.visibility_off:Icons.visibility).onTap(() {
              if(login_controller_dat.login_password_visibility_controller.value == false){
                login_controller_dat.login_password_visibility_controller.value = true;
              }else{
                login_controller_dat.login_password_visibility_controller.value = false;
              }
            }),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none
              )
          ),
          obscureText: login_controller_dat.login_password_visibility_controller.value,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end,children: [
          Text("Forgot Password?",style: TextStyle(fontWeight: FontWeight.w700,fontSize: f1,color: Colors.grey)),
        ],).p(10)
      ],
    ).paddingSymmetric(horizontal: 20),
  );
}


Widget login_proceed_btn_widget(){
  return ElevatedButton(
    style:  ElevatedButton.styleFrom(
      backgroundColor: Colors.redAccent, // Background color
      foregroundColor: Colors.white, // Text color
      // elevation: 5, // Elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Button border radius
      ),
    ),
    onPressed: (){
      login_controller_dat.validate();
    },
      child:Text("Log In",
          style: TextStyle(fontWeight: FontWeight.w700,fontSize: f1,color: Colors.white)),

  ).wFull(Get.context!).h(50).paddingSymmetric(horizontal: 20);
}