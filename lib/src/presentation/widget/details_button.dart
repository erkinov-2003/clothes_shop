import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  const DetailsButton({
    super.key,
    this.outlineFunction,
    this.elevatedFunction,
  });
  final void Function()? outlineFunction;
  final void Function()? elevatedFunction;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white, width: 0.2),
            fixedSize: Size(size.width * 0.408, size.height * 0.067),
            backgroundColor: AppColors.blackColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          onPressed: outlineFunction,
          child: Text(
            "Buy Now",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.bottomColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Jakarta",
                ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.bottomColor,
            fixedSize: Size(size.width * 0.408, size.height * 0.067),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          onPressed: elevatedFunction,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Add To Cart",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Jakarta",
                    ),
              ),
              const Image(
                image: AssetImage(AppIcons.shopIcon),
                height: 24,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
