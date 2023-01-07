import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProducts {
  Future<ProductModel> addProduct({
    required String id,
    required String title,
    required String description,
    required String image,
    required String category,
    required String price,
  }) async {
    Map<String, dynamic> data = await Api().putUrl(
      url: 'https://fakestoreapi.com/products/$id',
      body: ({
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'category': category,
        'price': price,
      }),
    );
    return ProductModel.fromJson(data);
  }
}
