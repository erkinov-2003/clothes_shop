import 'package:clotheses_shop/src/core/constants/app_colors.dart';
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
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: productList.isEmpty ? const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ) : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15), // Changed to all sides
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: AppColors.whiteColor),
                onChanged: (value) => searchFunction(value),
                decoration: const InputDecoration(
                  hintText: "Search product data",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.whiteColor,
                      width: 0.4,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
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
                  height: 550,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
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
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  const SizedBox(height: 10),
                                  Text(
                                    productList[index].description!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: AppColors.greenColor,
                                          fontFamily: "Jakarta",
                                          fontWeight: FontWeight.w500,
                                        ),
                                    maxLines: 3,
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
