import 'package:get/get.dart';

import '../controllers/grainsproducts_controller.dart';


class GrainsProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GrainsProductsController>(
      () => GrainsProductsController(),
    );
  }
}
