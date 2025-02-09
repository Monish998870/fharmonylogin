import 'package:get/get.dart';

import '../controllers/fruitsproducts_controller.dart';


class FruitsProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FruitsProductsController>(
      () => FruitsProductsController(),
    );
  }
}
