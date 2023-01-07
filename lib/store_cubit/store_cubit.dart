import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_th/store_cubit/store_states.dart';
import 'package:store_app_th/tools/models/product_model.dart';
import 'package:http/http.dart' as http;

import '../tools/helper/api.dart';

class StoreCubit extends Cubit<StoreStates> {
  StoreCubit() : super(StoreInitial());
  static StoreCubit get(context) => BlocProvider.of(context);

  List<ProductModel> productList = [];

  bool isSelected=false;

  List<String> categories = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
  ];
  // get all products
  void getProducts() async {
    emit(StoreLoadingData());
    await Api().getUrl(url: 'https://fakestoreapi.com/products').then((value) {
      List<dynamic> data = value;
      for (int i = 0; i < data.length; i++) {
        productList.add(
          ProductModel.fromJson(
            data[i],
          ),
        );
      }
      emit(StoreSuccessData());
    }).catchError((e) {
      emit(StoreFailData());
    });
  }
  // filter by specific category
  void getcategory({required String category,required int categori,}) async {
    emit(StoreLoadingData());
    productList = [];
    await Api()
        .getUrl(url: 'https://fakestoreapi.com/products/category/$category')
        .then((value) {
      List<dynamic> data = value;
      for (int i = 0; i < data.length; i++) {
        productList.add(
          ProductModel.fromJson(
            data[i],
          ),
        );
        Selecteditem(categori);
      }
      emit(CategoryStoreSuccessData());
    }).catchError((e) {
      emit(CategoryStoreFailData());
    });
  }
  //color selected category
  int? index;
  void Selecteditem(categori){
   index = categori;
   emit(ChangeColor());


  }


  List<ProductModel> CartList = [];

  void getCart(model)  {
    //emit(CartLoadingData());
    List<dynamic> Cart =[];
    Cart.add(model);
    for (int i = 0; i < Cart.length; i++) {

      CartList.add(Cart[i]);
      print(CartList);
      emit(CartSuccessData());
    }
   // emit(CartFailData());
  }

  bool isshow =false;
  void showText(isShow){
    isshow =! isshow;
  }



}
