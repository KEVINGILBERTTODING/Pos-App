import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/modules/home/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('home scren'),
      ),
    );
  }
}
