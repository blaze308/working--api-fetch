import 'package:api_fetch/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(title: Text("Fetch Data")),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  Row(children: [
                    Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              productController.productList[index].imageLink,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ))),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productController.productList[index].name,
                            style: TextStyle(fontSize: 18)),
                        Text(
                            productController.productList[index].category
                                .toString(),
                            style: TextStyle(fontSize: 14)),
                      ],
                    ))
                  ]),
                  Container(
                    color: Colors.blueGrey,
                    height: 2,
                  )
                ]);
              });
        }
      }),
    );
  }
}
