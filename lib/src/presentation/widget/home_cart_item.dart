import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({
    super.key,
    required this.cardImages,
    required this.title,
    required this.price,
    required this.description,
  });

  final String cardImages;
  final String title;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.246,
          width: size.width * 0.510,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cardImages),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.white, width: 0.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.020),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
                fontFamily: "Jakarta",
              ),
        ),
        SizedBox(height: size.height * 0.010),
        Text(
          description,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.greyColor,
                fontWeight: FontWeight.w500,
                fontFamily: "Jakarta",
              ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: size.height * 0.012),
        Text(
          price,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.greenColor,
                fontWeight: FontWeight.w600,
                fontFamily: "Jakarta",
              ),
        ),
        SizedBox(height: size.height * 0.010),
      ],
    );
  }
}
