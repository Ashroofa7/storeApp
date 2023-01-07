import '../helper/api.dart';

class GetCategory {
  Future<List> getProducts({required String categoryName}) async {
    List data = await Api().getUrl(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );
    return data;
  }
}
