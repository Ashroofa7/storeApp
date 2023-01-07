import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_th/store_cubit/store_cubit.dart';
import 'package:store_app_th/store_cubit/store_states.dart';

import 'package:store_app_th/widgets/custom_card.dart';

import 'cart_widget.dart';

class Products extends StatelessWidget {
  Products({Key? key}) : super(key: key);
  bool isOpened=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Cart();
            }));
          }, icon: const Icon(Icons.shopping_cart))
        ],
        title: const Text('New collection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<StoreCubit, StoreStates>(
          builder: (context, state) {
            {
              if (state is StoreLoadingData) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is StoreSuccessData ||
                  state is CategoryStoreSuccessData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              CategoriesList(
                            StoreCubit.get(context).categories[index],
                            index,

                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            width: 10,
                          ),
                          itemCount: StoreCubit.get(context).categories.length,
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.95,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                        ),
                        itemBuilder: (context, index) => CustomCard(
                            products:
                                StoreCubit.get(context).productList[index]),
                        itemCount: StoreCubit.get(context).productList.length,
                      ),
                    ],
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              CategoriesList(
                                StoreCubit.get(context).categories[index],
                                index,

                              ),
                          separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                            width: 10,
                          ),
                          itemCount: StoreCubit.get(context).categories.length,
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.95,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                        ),
                        itemBuilder: (context, index) => CustomCard(
                            products:
                            StoreCubit.get(context).productList[index]),
                        itemCount: StoreCubit.get(context).productList.length,
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

// Category List
class CategoriesList extends StatelessWidget {
  CategoriesList(
    this.categori,
    this.index,
     {
    Key? key,
  }) : super(key: key);
  String categori;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        StoreCubit.get(context).getcategory(
          category: categori,
          categori: index,
        );

      },
      child: Container(
        decoration: BoxDecoration(
          color: StoreCubit.get(context).index == index
              ? Colors.blue.shade900
              : Colors.blueGrey.shade500,
          borderRadius: BorderRadius.circular(12),
        ),
        // width: 190,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              categori.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
