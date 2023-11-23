import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/home/controller/home_controller.dart';
import 'package:pet_store/shared/items/item_result.dart';
import 'package:pet_store/shared/items/item_suggestion.dart';
import 'package:pet_store/shared/widgets/image_slider.dart';
import 'package:pet_store/shared/widgets/panel/menu_panel.dart';

import '../../../models/product.dart';
import '../../../shared/items/item_product.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log('Home View');
    double baseHeight = MediaQuery.of(context).size.width * 0.45 + 180.0;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const Drawer(
          backgroundColor: Colors.white,
          child: MenuPanel(),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 320.0,
              backgroundColor: Colors.white,
              elevation: 1.0,
              centerTitle: true,
              pinned: true,
              snap: false,
              floating: false,
              iconTheme: const IconThemeData(color: Colors.black),
              title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/pet_store_icon.png',
                      width: 32.0,
                      height: 32.0,
                    ),
                    const SizedBox(width: 12.0),
                    const Text(
                      'Pet Store',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              flexibleSpace: FlexibleSpaceBar(
                background: ImageSlider(images: controller.images),
              ),
              bottom: TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: controller.categories
                    .map((e) => Tab(text: e.toUpperCase()))
                    .toList(),
                onTap: (index) {
                  controller.productWithCategoryList.value =
                      filterProductListWithCategory(
                          controller.categories[index]);
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchProductDelegate(),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
                child: Obx(() => Container(
                      height: MediaQuery.of(context).size.width * 0.45 + 148.0,
                      margin: const EdgeInsets.only(left: 8.0, top: 12.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.productWithCategoryList.length,
                        itemBuilder: (context, index) {
                          return ItemProduct(
                            product: controller.productWithCategoryList[index],
                            onAddCart: (product, quantity) {
                              controller.onAddProductToCart(product, quantity);
                            },
                            onBuyNow: (product, value) {
                              controller.onBuyNowProduct(product, value);
                            },
                          );
                        },
                      ),
                    ))),
            SliverToBoxAdapter(
              child: Container(
                height: baseHeight,
                margin: const EdgeInsets.only(left: 8.0, top: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Đồ Chơi | Dụng Cụ Ăn Uống'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Obx(() => Container(
                            height: MediaQuery.of(context).size.width * 0.45 +
                                148.0,
                            margin: const EdgeInsets.only(top: 16.0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.dataList1.length,
                              itemBuilder: (context, index) {
                                return ItemProduct(
                                  product: controller.dataList1[index],
                                  onAddCart: (product, quantity) {
                                    controller.onAddProductToCart(
                                        product, quantity);
                                  },
                                  onBuyNow: (product, value) {
                                    controller.onBuyNowProduct(product, value);
                                  },
                                );
                              },
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: baseHeight,
                margin: const EdgeInsets.only(left: 8.0, top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sữa Tắm | Nước Hoa | Khử Mùi'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => Container(
                          height:
                              MediaQuery.of(context).size.width * 0.45 + 148.0,
                          margin: const EdgeInsets.only(top: 16.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.dataList2.length,
                            itemBuilder: (context, index) {
                              return ItemProduct(
                                product: controller.dataList2[index],
                                onAddCart: (product, quantity) {
                                  controller.onAddProductToCart(
                                      product, quantity);
                                },
                                onBuyNow: (product, value) {
                                  controller.onBuyNowProduct(product, value);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: baseHeight,
                margin: const EdgeInsets.only(left: 8.0, top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sản Phẩm Vệ Sinh'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => Container(
                          height:
                              MediaQuery.of(context).size.width * 0.45 + 148.0,
                          margin: const EdgeInsets.only(top: 16.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.dataList3.length,
                            itemBuilder: (context, index) {
                              return ItemProduct(
                                product: controller.dataList3[index],
                                onAddCart: (product, quantity) {
                                  controller.onAddProductToCart(
                                      product, quantity);
                                },
                                onBuyNow: (product, value) {
                                  controller.onBuyNowProduct(product, value);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: baseHeight,
                margin: const EdgeInsets.only(left: 8.0, top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chuồng | Lồng | Balo | Túi Xách'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => Container(
                          height:
                              MediaQuery.of(context).size.width * 0.45 + 148.0,
                          margin: const EdgeInsets.only(top: 16.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.dataList4.length,
                            itemBuilder: (context, index) {
                              return ItemProduct(
                                product: controller.dataList4[index],
                                onAddCart: (product, quantity) {
                                  controller.onAddProductToCart(
                                      product, quantity);
                                },
                                onBuyNow: (product, value) {
                                  controller.onBuyNowProduct(product, value);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Product> filterProductListWithCategory(String category) {
    switch (category) {
      case 'Sản phẩm mới':
        return controller.productList;
      case 'Sản phẩm khuyến mãi':
        return controller.productList
            .where((element) => element.discount != null)
            .toList();
      case 'Sản phẩm bán chạy':
        return controller.productList;
      default:
        return controller.productList
            .where((e) => e.categories
                .where((element) =>
                    element.toUpperCase().contains(category.toUpperCase()))
                .isNotEmpty)
            .toList();
    }
  }
}

class SearchProductDelegate extends SearchDelegate {
  List<Product> dataList = [];
  final controller = Get.find<HomeController>();

  SearchProductDelegate() {
    dataList = controller.productList;
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            )));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query != '') {
              query = '';
            } else {
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    final resultList = dataList.where((e) => e.name.contains(query)).toList();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: resultList.length,
      itemBuilder: (context, index) => ItemResult(
        product: resultList[index],
        onBuyNow: (product) {
          controller.onBuyNowProduct(product, 1);
        },
        onAddCart: (product) {
          controller.onAddProductToCart(product, 1);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList =
        dataList.where((e) => e.name.contains(query)).toList();
    return suggestionList.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemCount: suggestionList.length,
            itemBuilder: (context, index) => InkWell(
              child: ItemSuggestion(product: suggestionList[index]),
              onTap: () {
                query = suggestionList[index].name;
              },
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1.0),
          )
        : const Center(
            child: Text(
              'Không có sản phẩm nào',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          );
  }
}
