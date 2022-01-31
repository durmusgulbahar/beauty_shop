import 'package:api_deneme/models/product.dart';
import 'package:api_deneme/services/remote_services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    //controller oluşturulurken çalıştırılan code bloğu
    fetchProduct();

    super.onInit();
  }

  void fetchProduct() async {
    //datayı çekmeye çalışıyor
    var products = await RemoteService.fetchProducts();

    ///datayı başarıyla çekip productList'e atıyor. Artık productList'te bütün Product objelerimiz
    ///bulunuyor.

    productList.value = products;
  }
}
