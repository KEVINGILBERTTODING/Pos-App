import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/modules/auth/controllers/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
