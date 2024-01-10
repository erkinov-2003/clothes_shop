import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_images.dart';
import 'package:clotheses_shop/src/presentation/widget/card_items.dart';
import 'package:clotheses_shop/src/presentation/widget/custom_botton.dart';
import 'package:clotheses_shop/src/presentation/widget/is_empty_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: mainController.getCardList.isEmpty
              ? const IsEmptyList(
                  title: "Your cart is empty",
                  images: AppImages.cardEmpty,
                  description:
                      "Looks like you have not added anything in your cart. Go ahead and explore top products.",
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.605,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: mainController.getCardList.length,
                        itemBuilder: (context, index) {
                          return CustomCardItem(
                            title: mainController.getCardList[index].title,
                            price: mainController.getCardList[index].price,
                            images: mainController.getCardList[index].images,
                            index: index,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.023),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Order Info",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Jakarta",
                                ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.023),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Jakarta",
                                ),
                          ),
                          Text(
                            "\$ 27.25",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Jakarta",
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.044),
                    Center(
                      child: CustomBottom(
                        onPressed: () => {},
                        bottomText: "Checkout",
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
