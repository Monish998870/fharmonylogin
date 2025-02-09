import 'package:get/get.dart';

import '../controllers/vegetablesproducts_controller.dart';

class VegetablesProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegetablesProductsController>(
      () => VegetablesProductsController(),
    );
  }
}
