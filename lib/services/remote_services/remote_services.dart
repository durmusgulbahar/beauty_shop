import 'package:api_deneme/models/product.dart';
import 'package:http/http.dart' as http;

/// Burada HTTP aracılığıyla siteyi çekiyorz. aşağıdaki linke tıklayıp görebiliriz. karmakarışık bir
/// sites
class RemoteService {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    //bize Productlardan oluşan liste döndürücek
    var response = await client.get(Uri.parse(
        //direkt linki değilde Uri.parse(link) şeklinde
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      //200 OKAY demek yani başarıyla cevap alındı
      var jsonString = response
          .body; // burada HTML body'de yer alan dataları bir string olarak alıyoruz
      return productFromJson(jsonString); // model dosyasından bir method
    } else {
      throw Exception('ERROR');
    }
  }
}
