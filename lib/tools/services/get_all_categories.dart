import '../helper/api.dart';

class GetAllCategories {
  Future<List> getProducts() async {
    List data = await Api().getUrl(
      url: 'https://fakestoreapi.com/products/categories',
    );
    return data;
  }
}
