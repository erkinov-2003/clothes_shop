import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:clotheses_shop/src/presentation/screens/home/cart_screen.dart';
import 'package:clotheses_shop/src/presentation/screens/home/favorite_screen.dart';
import 'package:clotheses_shop/src/presentation/screens/home/home_screen.dart';
import 'package:clotheses_shop/src/presentation/screens/home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({super.key});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          mainController.currentIndexFunction(value);
          pageController.animateToPage(
            mainController.currentIndex,
            duration: const Duration(microseconds: 250),
            curve: Curves.linear,
          );
        },
        showUnselectedLabels: true,
        backgroundColor: AppColors.blackColor,
        currentIndex: mainController.currentIndex,
        selectedLabelStyle: const TextStyle(fontFamily: "Jakarta"),
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.blackColor,
            icon: Image(
              image: const AssetImage(AppIcons.homeIcon),
              color: mainController.currentIndex == 0
                  ? Colors.red
                  : AppColors.whiteColor,
              height: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.blackColor,
            icon: Image(
              image: const AssetImage(AppIcons.shopIcon),
              height: 24,
              color: mainController.currentIndex == 1
                  ? Colors.red
                  : AppColors.whiteColor,
            ),
            label: "My Cart",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.blackColor,
            icon: Image(
              image: const AssetImage(AppIcons.favoriteIcon),
              height: 24,
              color: mainController.currentIndex == 2
                  ? Colors.red
                  : AppColors.whiteColor,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.blackColor,
            icon: Image(
              image: const AssetImage(AppIcons.profileIcon),
              height: 24,
              color: mainController.currentIndex == 3
                  ? Colors.red
                  : AppColors.whiteColor,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) => mainController.currentIndexFunction(value),
        children: const [
          HomeScreen(),
          CardScreen(),
          FavoriteScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
