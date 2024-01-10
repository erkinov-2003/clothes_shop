import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({
    super.key,
    required this.title,
    required this.description,
    this.skipFunction,
    required this.cardImages,
    required this.index,
    this.arrowFunction,
  });
  final String title;
  final String description;
  final void Function()? skipFunction;
  final String cardImages;
  final int index;
  final void Function()? arrowFunction;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.504,
            width: double.infinity,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.onboardingCardColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        index == 0
                            ? const Image(
                                image: AssetImage(AppIcons.logoIcon),
                                fit: BoxFit.cover,
                                height: 40,
                              )
                            : IconButton(
                                onPressed: arrowFunction,
                                icon: const Image(
                                  image: AssetImage(AppIcons.arrowLeft),
                                  height: 35,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                        index == 2
                            ? const SizedBox()
                            : TextButton(
                                onPressed: skipFunction,
                                child: Text(
                                  "Next for now",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppColors.bottomColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                      ],
                    ),
                    const Spacer(flex: 4),
                    Center(
                      child: Image(
                        image: AssetImage(cardImages),
                        height: 250,
                      ),
                    ),
                    const Spacer(flex: 4),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.033),
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Jakarta",
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: size.height * 0.022),
          Text(
            description,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Jakarta",
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
