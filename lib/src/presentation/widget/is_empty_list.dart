import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class IsEmptyList extends StatelessWidget {
  const IsEmptyList({
    super.key,
    required this.title,
    required this.images,
    required this.description,
  });
  final String title;
  final String description;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              images,
            ),
            height: 240,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Jakarta",
                ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              description,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Jakarta",
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
