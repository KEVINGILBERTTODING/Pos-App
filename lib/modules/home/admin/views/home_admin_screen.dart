import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/modules/home/admin/controllers/home_admin_controller.dart';

class HomeAdminScreen extends GetView<HomeAdminController> {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Admin home screen'),
      ),
    );
  }
}
