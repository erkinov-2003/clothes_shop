import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
    required this.title,
    required this.images,
    this.onPressed,
  });
  final String title;
  final String images;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(images),
                    height: 24,
                    color: AppColors.greyColor,
                  ),
                  const SizedBox(width: 25),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ],
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.whiteColor,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 0.3,
          color: AppColors.whiteColor,
        ),
      ],
    );
  }
}
