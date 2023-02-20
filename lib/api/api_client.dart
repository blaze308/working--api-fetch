import 'package:api_fetch/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static var client = http.Client();

  static Future<List<ProductModel>> fetchProducts() async {
    // var response = await client.get(Uri.parse(
    //     "https://makeup-api.herokuapp.com/api/v1/products.json"));

    var response = await client.get(Uri.parse(
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    }
    return fetchProducts();
  }
}
