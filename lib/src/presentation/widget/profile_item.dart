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
        ListTile(
          onTap: onPressed,
          leading: Image(
            image: AssetImage(images),
            height: 24,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.greenColor,
                ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
            color: AppColors.greyColor,
          ),
        ),
        const SizedBox(height: 10),
        const Divider(height: 0.3, color: AppColors.whiteColor),
      ],
    );
  }
}
