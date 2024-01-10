import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 160,
          width: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.020),
        const SizedBox(
          height: 20,
          width: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.010),
        const SizedBox(
          height: 20,
          width: 200,
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
          ),
        ),
        SizedBox(height: size.height * 0.010),
        const SizedBox(
          height: 20,
          width: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
