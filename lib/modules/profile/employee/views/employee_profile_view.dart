import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/services/remote/end_point.dart';
import 'package:pos_app/modules/profile/employee/bindings/employee_profile_binding.dart';
import 'package:pos_app/modules/profile/employee/controllers/employee_profile_controller.dart';
import 'package:pos_app/styles/styles.dart';

class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isObsecuredOldPass = true.obs;
    RxBool isObsecuredNewPass = true.obs;
    final controller = Get.put(EmployeeProfileController());
    EmployeeProfileBinding().dependencies;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: StylesApp.primaryColor,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 10.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Profil Saya',
                            style:
                                TextStyle(fontFamily: 'popsem', fontSize: 20),
                          ),
                          subtitle: Text(
                            "Halaman untuk mengubah akun.",
                            style:
                                TextStyle(fontFamily: 'popreg', fontSize: 10),
                          ),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipOval(
                                child: Image.network(
                                  EndPoint.base_url_image +
                                      controller.clientModel.value.foto
                                          .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: controller.nameController,
                          keyboardType: TextInputType.emailAddress,
                          style:
                              TextStyle(fontFamily: 'popmed', fontSize: 7.sp),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_2_outlined),
                              focusColor: StylesApp.primaryColor,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: StylesApp.primaryColor,
                                      width: 1.0,
                                      style: BorderStyle.solid)),
                              hintText: "Masukkan email anda"),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          obscureText: isObsecuredOldPass.value,
                          controller: controller.oldPwController,
                          keyboardType: TextInputType.visiblePassword,
                          style:
                              TextStyle(fontFamily: 'popmed', fontSize: 7.sp),
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: const Icon(Icons.key_sharp),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Kata sandi lama",
                            suffixIcon: IconButton(
                              icon: Icon(
                                  (isObsecuredOldPass.value)
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  semanticLabel: "Show password"),
                              color: (isObsecuredOldPass.value)
                                  ? Colors.black
                                  : StylesApp.primaryColor,
                              onPressed: () => isObsecuredOldPass.value =
                                  !(isObsecuredOldPass.value),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          obscureText: isObsecuredOldPass.value,
                          controller: controller.newPw,
                          keyboardType: TextInputType.visiblePassword,
                          style:
                              TextStyle(fontFamily: 'popmed', fontSize: 7.sp),
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: const Icon(Icons.key_sharp),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Kata sandi baru",
                            suffixIcon: IconButton(
                              icon: Icon(
                                  (isObsecuredNewPass.value)
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  semanticLabel: "Show password"),
                              color: (isObsecuredNewPass.value)
                                  ? Colors.black
                                  : StylesApp.primaryColor,
                              onPressed: () => isObsecuredNewPass.value =
                                  !(isObsecuredNewPass.value),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: controller.isLoadingUpdateData.value
                                  ? CircularProgressIndicator(
                                      backgroundColor: Colors.blue,
                                    )
                                  : TextButton(
                                      onPressed: () async {
                                        await controller.inputValidation();
                                      },
                                      child: Text(
                                        'Simpan data',
                                        style: TextStyle(
                                            fontFamily: 'popsem',
                                            color: Colors.blue,
                                            fontSize: 6.sp),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.blue[50]),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
