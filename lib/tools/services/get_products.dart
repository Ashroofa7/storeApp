import '../models/product_model.dart';
import '../helper/api.dart';


class GetProducts {
  Future<List<ProductModel>> getProducts() async {
    List<dynamic> data =
        await Api().getUrl(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(
          data[i],
        ),
      );
    }
    return productList;
  }
}
