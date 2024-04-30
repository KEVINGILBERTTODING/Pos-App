import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<dynamic> foodList = [].obs;

  Future<void> addProduct(String data) async {
    foodList.add(data);
  }

  void deleteProduct(int index) {
    foodList.removeAt(index);
  }
}
