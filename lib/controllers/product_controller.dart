import 'package:api_fetch/api/api_client.dart';
import 'package:api_fetch/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiClient.fetchProducts();
      productList.assignAll(products);
    } finally {
      isLoading(false);
    }
  }
}
