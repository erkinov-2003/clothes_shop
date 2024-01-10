import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/presentation/widget/favorite_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => const FavoriteItems(),
          ),
        ),
      ),
    );
  }
}
