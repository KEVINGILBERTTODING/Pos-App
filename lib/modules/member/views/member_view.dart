import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pos_app/modules/category/binding/category_binding.dart';
import 'package:pos_app/modules/category/controllers/category_controller.dart';
import 'package:pos_app/modules/member/bindings/member_binding.dart';
import 'package:pos_app/modules/member/controllers/member_controller.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MemberController());
    MemberBinding().dependencies;
    controller.getMember();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Member',
                          style: TextStyle(fontFamily: 'popsem', fontSize: 20),
                        ),
                        subtitle: Text(
                          'Halaman untuk menambahkan member baru.',
                          style: TextStyle(fontFamily: 'popreg', fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      if (controller.isLoading.value)
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.blue[50],
                            color: Colors.blue,
                          ),
                        )
                      else if (controller.memberModelList.value.isEmpty)
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Tidak ada data.',
                            style: TextStyle(
                              fontFamily: 'popmed',
                              fontSize: 6.sp,
                              color: Colors.black,
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.memberModelList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var memberList =
                                controller.memberModelList.value[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(
                                CupertinoIcons.person_2_square_stack,
                                color: Colors.black,
                              ),
                              title: Text(
                                memberList.nama.toString(),
                                style: TextStyle(
                                    fontFamily: 'popmed',
                                    color: Colors.black,
                                    fontSize: 7.sp),
                              ),
                              subtitle: Text(
                                memberList.telepon.toString(),
                                style: TextStyle(
                                    fontFamily: 'popreg',
                                    color: Colors.grey,
                                    fontSize: 5.sp),
                              ),
                              trailing: GestureDetector(
                                onTap: () async {
                                  await controller.destroyMember(
                                      memberList.id_member, index);
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Container(
                                    color: Colors.red[50],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        CupertinoIcons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(20),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.h, right: 10.w),
                width: 120.w,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tambah Member Baru",
                        style: TextStyle(fontFamily: 'popsem', fontSize: 8.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextField(
                        controller: controller.namaMemberController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'popmed',
                            fontSize: 6.sp,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Nama',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextField(
                        controller: controller.teleponMemberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'popmed',
                            fontSize: 6.sp,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Telepon',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextField(
                        controller: controller.alamatMemberController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'popmed',
                            fontSize: 6.sp,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Alamat',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        children: [
                          controller.isLoadingStore.value == true
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.blue[50],
                                    color: Colors.blue,
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.topRight,
                                  child: TextButton(
                                    onPressed: () async {
                                      await controller.validationStore();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        Colors.blue[50],
                                      ),
                                    ),
                                    child: Text(
                                      'Simpan',
                                      style: TextStyle(
                                        fontFamily: 'popmed',
                                        fontSize: 6.sp,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
