import 'package:fit_bharat_family/config/globals/secrets.dart';
import 'package:fit_bharat_family/data/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  Future<List<Product>?> fetchAllProducts() async {
    String url = Secrets.baseURL +
        "products?consumer_key=${Secrets.customerKey}&consumer_secret=${Secrets.customerSecret}";

    Uri uri = Uri.parse(url);
    var res = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode == 200) {
      List<Product> product = Product.fromJsonList(res.body);
      return product;
    }
    return null;
  }
}
