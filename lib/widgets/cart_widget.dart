import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_th/store_cubit/store_cubit.dart';
import 'package:store_app_th/store_cubit/store_states.dart';
import 'package:store_app_th/widgets/checkout_widget.dart';

import '../tools/helper/customButton.dart';
import '../tools/helper/custom_cart_button.dart';
import '../tools/models/product_model.dart';

class Cart extends StatelessWidget {
  Cart({super.key,this.model,this.isTrue});
  ProductModel? model;
  bool? isTrue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: BlocConsumer<StoreCubit,StoreStates>(
            listener: (context, state) {
              (istrue){
                return StoreCubit.get(context).getCart(model);
              };
            },
            builder: (context, state) {
              if (state is CartLoadingData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CartSuccessData) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      CartWidget(
                        StoreCubit.get(context).CartList[index]
                      ),
                  itemCount: StoreCubit.get(context).CartList.length,
                );
              } else {
                return const Center(
                  child: Text(
                    'There\'s Nothing in Your Cart',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
   CartWidget(this.product, {
    Key? key,
  }) : super(key: key);
  ProductModel? product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // detail of image
            SizedBox(
              width: MediaQuery.of(context).size.width * .25,
              child:  Image(
                image: NetworkImage(
                     '${product!.image}',
                    ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Detail of title
                   Text(
                     product!.title!,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //Detail of price and rating
                  Text(
                    '${product!.price}' r' $',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Cart Button
                  CustomButton(
                    name: 'Checkout',
                    radius: 10,
                    height: 50,
                    ontap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Checkout(product!);
                      }),);

                    },
                    Containercolor: Colors.blue.shade900,
                    Textcolor: Colors.white,
                    fontsize: 20,
                    fontweight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
