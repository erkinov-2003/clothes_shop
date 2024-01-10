import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_icons.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.counterText,
    this.minusPressed,
    this.addPressed,
  });
  final String counterText;
  final void Function()? minusPressed;
  final void Function()? addPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteColor, width: 0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: addPressed,
                child: const Image(
                  image: AssetImage(AppIcons.addIcon),
                ),
              ),
              Text(
                counterText,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Jakarata",
                    ),
              ),
              GestureDetector(
                onTap: minusPressed,
                child: const Image(
                  image: AssetImage(AppIcons.minusIcon),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
