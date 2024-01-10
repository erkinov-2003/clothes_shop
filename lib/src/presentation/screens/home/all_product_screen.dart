import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/presentation/screens/home/details_screen.dart';
import 'package:clotheses_shop/src/presentation/widget/home_cart_item.dart';
import 'package:flutter/material.dart';

import '../../../data/model/product_model.dart';
import '../../../services/api_service.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  List<Product> productList = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getAllProductData();
  }

  Future<void> getAllProductData() async {
    final service = await ApiService().getAllProductData();
    setState(() {
      productList = service;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: productList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 400,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              images: productList[index].images![0],
                              title: productList[index].title!,
                              price: "\$${productList[index].price}",
                              description: productList[index].description!,
                            ),
                          ),
                        );
                      },
                      child: CustomHomeItem(
                        cardImages: productList[index].images![0],
                        title: productList[index].title!,
                        price: "\$${productList[index].price}",
                        description: productList[index].description!,
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
