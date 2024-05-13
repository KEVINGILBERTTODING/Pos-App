import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/modules/auth/controllers/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isObsecuredPass = true.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/img/main_logo.jpeg',
                    width: ScreenUtil().setWidth(100),
                    height: ScreenUtil().setHeight(100),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Text(
                        'Hi, Selamat datang',
                        style: TextStyle(fontFamily: 'popsem', fontSize: 9.sp),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontFamily: 'popmed', fontSize: 7.sp),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(CupertinoIcons.mail),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'popmed',
                            fontSize: 6.sp,
                          ),
                          hintText: "Masukkan email anda",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      TextFormField(
                        obscureText: isObsecuredPass.value,
                        controller: controller.pwController,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(fontFamily: 'popmed', fontSize: 7.sp),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'popmed',
                            fontSize: 6.sp,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(CupertinoIcons.lock),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Kata sandi anda",
                          suffixIcon: IconButton(
                            icon: Icon(
                                (isObsecuredPass.value)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                semanticLabel: "Show password"),
                            color: (isObsecuredPass.value)
                                ? Colors.black
                                : Colors.blue,
                            onPressed: () => isObsecuredPass.value =
                                !(isObsecuredPass.value),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  controller.validateLogin();
                                },
                                child: controller.isLoading.value
                                    ? CircularProgressIndicator(
                                        backgroundColor: Colors.blue[50],
                                        color: Colors.blue,
                                      )
                                    : Container(
                                        width: 70.w,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.blue[50],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Text(
                                          'Masuk',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'popmed',
                                              fontSize: 7.sp,
                                              color: Colors.blue),
                                        ),
                                      ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
