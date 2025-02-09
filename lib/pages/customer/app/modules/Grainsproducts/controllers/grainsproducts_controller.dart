import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';

class GrainsProductsController extends GetxController {

  // to hold the products
  List<ProductModel> products = [];

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  /// get products from dummy helper
  getProducts() {
    products.addAll(DummyHelper.products.sublist(12,16));
  //  products.removeWhere((p) => p.id == 2);
  }
}
