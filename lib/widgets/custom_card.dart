import 'package:flutter/material.dart';
import 'package:store_app_th/tools/models/product_model.dart';
import 'package:store_app_th/widgets/details_screen.dart';

class CustomCard extends StatelessWidget {
   CustomCard({Key? key,
   this.products}) : super(key: key);
  ProductModel? products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductDetails(products);
              },
            ),
          );
        },
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 0,
                      offset: const Offset(10, 10),
                    ),
                  ],
                ),
                child: Card(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products!.title!,style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                        ),
                        maxLines: 1,),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                              r'$ ' '${products!.price}',style: const TextStyle(
                               fontSize: 20
                             ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border_outlined))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
               Positioned(
                  //left: 45,
                  top: -40,
                  right: 10,
                  child: Image(
                    image: NetworkImage(
                      '${products!.image}',
                    ),
                    height: 105,
                    width: MediaQuery.of(context).size.width*.35,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
