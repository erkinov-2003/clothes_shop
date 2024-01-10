import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/presentation/widget/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_images.dart';
import '../../widget/is_empty_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: mainController.getFavoriteList.isEmpty
              ? const Center(
                  child: IsEmptyList(
                    title: "Your favorite is empty",
                    images: AppImages.favoriteEmpty,
                    description:
                        "Looks like you have not added anything in your cart. Go ahead and explore top products.",
                  ),
                )
              : ListView.builder(
                  itemCount: mainController.getFavoriteList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FavoriteItems(
                      title: mainController.getFavoriteList[index].title,
                      price: mainController.getFavoriteList[index].price,
                      images: mainController.getFavoriteList[index].images,
                      index: index,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
