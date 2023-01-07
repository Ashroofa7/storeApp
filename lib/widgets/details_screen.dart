import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_th/store_cubit/store_cubit.dart';
import 'package:store_app_th/store_cubit/store_states.dart';
import 'package:store_app_th/tools/helper/customButton.dart';
import 'package:store_app_th/tools/models/product_model.dart';
import 'package:store_app_th/widgets/cart_widget.dart';

import '../tools/helper/custom_cart_button.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails(this.products, {Key? key}) : super(key: key);
  ProductModel? products;
  bool isShow = false;
  bool isTrue=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<StoreCubit,StoreStates>(
              listener: (context,state){
                if (state is  CartFailData){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Already added',
                      ),
                    ),
                  );
                }else if ( state is CartSuccessData){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Added to Cart',
                      ),
                    ),
                  );
                }
              },
              builder: (context,state){
            return  Column(
              children: [
                //Details Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // detail of image
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .25,
                          child: Image(
                            image: NetworkImage(
                              '${products!.image}',
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
                                products!.title!,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              //Detail of price and rating
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${products!.price}' r' $',
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${products!.rating!.rate}',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '${products!.rating!.count}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                  Text(
                                    'Ratings',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue.shade900,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              // Cart Button
                              CustomCartButoon(
                                name: 'Add To Cart',
                                radius: 10,
                                height: 50,
                                iconData: Icons.add_shopping_cart_outlined,
                                color: Colors.white,
                                ontap: () {

                                  StoreCubit.get(context).getCart(products,);

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
                ),
                // Description Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                StoreCubit.get(context).showText(isShow);
                              },
                              icon: Icon(
                                StoreCubit.get(context).isshow
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          products!.description!,
                          style: TextStyle(
                            overflow: isShow
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            fontSize: 18,
                            fontWeight: isShow ? FontWeight.w600 : null,
                          ),
                          maxLines: isShow ? 20 : 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CustomButton(
                            name: 'Buy Now',
                            height: 50,
                            ontap: () {},
                            Textcolor: Colors.white,
                            Containercolor: Colors.blue.shade900,
                            radius: 10,
                            fontsize: 20,
                            fontweight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          })
        ),
      ),
    );
  }
}
