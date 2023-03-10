import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';

class ViewProductScreen extends StatelessWidget {
  ViewProductScreen({Key? key}) : super(key: key);

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    controller.getProduct();
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Product List'),
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) => controller.allProduct.isEmpty
            ? const Center(
                child: Text('😔 NO DATA FOUND (: 😔'),
              )
            : ListView.builder(
                itemCount: controller.allProduct.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("ABOUT PRODUCT"),
                          const SizedBox(
                            height: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Product Name :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.allProduct[index].pname,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Product Price :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.allProduct[index].pprice,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Product Details :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.allProduct[index].pdetails,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
