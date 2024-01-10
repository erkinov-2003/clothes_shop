import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/presentation/screens/home/details_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/model/product_model.dart';
import '../../../services/api_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> productList = [];

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

  void searchFunction(String query) {
    final suggestions = productList.where((element) {
      final productTitle = element.title!.toLowerCase();
      final input = query.toLowerCase();
      return productTitle.contains(input);
    }).toList();
    setState(() {
      productList = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15), // Changed to all sides
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(color: AppColors.whiteColor),
                      onChanged: (value) => searchFunction(value),
                      decoration: InputDecoration(
                        hintText: "Search product data",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                          color: AppColors.greyColor,
                          fontFamily: "Jakarta",
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: AppColors.whiteColor,
                            width: 0.4,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: AppColors.whiteColor,
                            width: 0.4,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: size.height * 0.560,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                            images:
                                                productList[index].images![0],
                                            title: productList[index].title!,
                                            price:
                                                "\$${productList[index].price}",
                                            description:
                                                productList[index].description!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      height: size.height * 0.112,
                                      width: size.width * 0.255,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                productList[index].images![0]),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.height * 0.016),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productList[index].title!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: AppColors.whiteColor,
                                                fontFamily: "Jakarta",
                                                fontWeight: FontWeight.w600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(width: size.height * 0.013),
                                        Text(
                                          productList[index].description!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: AppColors.greyColor,
                                                fontFamily: "Jakarta",
                                                fontWeight: FontWeight.w500,
                                              ),
                                          maxLines: 2,
                                        ),
                                        SizedBox(width: size.height * 0.013),
                                        Text(
                                          "\$${productList[index].price}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: AppColors.greenColor,
                                                fontFamily: "Jakarta",
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
