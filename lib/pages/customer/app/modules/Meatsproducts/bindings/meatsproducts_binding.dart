import 'package:get/get.dart';

import '../controllers/meatsproducts_controller.dart';


class MeatsProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeatsProductsController>(
      () => MeatsProductsController(),
    );
  }
}
