import 'package:api_deneme/screens/product_tile.dart';
import 'package:api_deneme/services/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ProductController prController = Get.put(ProductController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'BeautiFULL',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.view_list_rounded)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.grid_view),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: prController.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(prController.productList[index]);
                    //Product objelerimizi Tile dosyamıza gönderiyoruz. ve
                    // itemCount kadar bize tile oluşturup ekranda gösteriyor.
                  }),
            ),
          )
        ],
      ),
    );
  }
}
