import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:clotheses_shop/src/presentation/screens/home/all_product_screen.dart';
import 'package:clotheses_shop/src/presentation/screens/home/details_screen.dart';
import 'package:clotheses_shop/src/presentation/screens/home/search_screen.dart';
import 'package:clotheses_shop/src/presentation/widget/home_cart_item.dart';
import 'package:clotheses_shop/src/presentation/widget/home_corousel.dart';
import 'package:clotheses_shop/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final mainController = Provider.of<MainController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.blackColor,
        title: Image.asset(AppIcons.logoIcon, height: 30),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => mainController.navigationPages(
                context,
                const SearchScreen(),
              ),
              icon: const Image(
                image: AssetImage(AppIcons.searchIcon),
                height: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHomeCarousel(),
              SizedBox(height: size.height * 0.025),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest Products',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Jakarta',
                          ),
                    ),
                    GestureDetector(
                      onTap: () => mainController.navigationPages(
                        context,
                        const AllProductScreen(),
                      ),
                      child: Text(
                        'SEE ALL',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.bottomColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Jakarta',
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.030),
              productList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 400,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => mainController.navigationPages(
                              context,
                              DetailsScreen(
                                images: productList[index].images![0],
                                title: productList[index].title!,
                                price: "\$${productList[index].price}",
                                description: productList[index].description!,
                              ),
                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
