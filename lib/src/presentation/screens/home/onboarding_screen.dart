import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_images.dart';
import 'package:clotheses_shop/src/presentation/screens/register/auth_gete.dart';
import 'package:clotheses_shop/src/presentation/screens/register/switch_page.dart';
import 'package:clotheses_shop/src/presentation/widget/custom_botton.dart';
import 'package:clotheses_shop/src/presentation/widget/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.781,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                onPageChanged: (value) =>
                    mainController.onboardingButton(value),
                children: [
                  CustomOnboardingItem(
                    title: "Explore a wide range of\nproducts",
                    description:
                        "Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.",
                    skipFunction: () {
                      controller.jumpToPage(2);
                    },
                    cardImages: AppImages.onboardingItem1,
                    index: mainController.index,
                  ),
                  CustomOnboardingItem(
                    title: "Unlock exclusive offers\nand discounts",
                    description:
                        "Get access to limited-time deals and special promotions available only to our valued customers.",
                    index: mainController.index,
                    cardImages: AppImages.onboardingItem2,
                    skipFunction: () {
                      controller.jumpToPage(2);
                    },
                    arrowFunction: () {
                      controller.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },
                  ),
                  CustomOnboardingItem(
                    title: "Safe and secure\npayments",
                    description:
                        "Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.",
                    index: mainController.index,
                    cardImages: AppImages.onboardingItem3,
                    arrowFunction: () {
                      controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },
                  )
                ],
              ),
            ),
            mainController.index == 2
                ? CustomBottom(
                    bottomText: "Get Started",
                    onPressed: () => mainController.navigationPages(
                      context,
                      const AuthGate(),
                    ),
                  )
                : CustomBottom(
                    bottomText: "Next",
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(microseconds: 200),
                        curve: Curves.linear,
                      );
                    },
                  ),
            SizedBox(height: size.height * 0.028),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                activeDotColor: AppColors.bottomColor,
                dotHeight: 9,
                dotWidth: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
