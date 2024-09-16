import 'package:get/get.dart';
import 'package:untitled2/controller/flower_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FlowerController());
  }

}