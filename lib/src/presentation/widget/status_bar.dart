import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core/constants/app_colors.dart';

class CustomStatusBar extends StatefulWidget {
  const CustomStatusBar({super.key});

  @override
  State<CustomStatusBar> createState() => _CustomStatusBarState();
}

class _CustomStatusBarState extends State<CustomStatusBar> {
  double ratingBar = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar.builder(
          initialRating: 1,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          glowColor: Colors.grey,
          itemSize: 30,
          unratedColor: Colors.grey,
          itemPadding: const EdgeInsets.all(4),
          itemBuilder: (context, _) {
            return const Icon(
              Icons.star,
              color: Colors.amber,
              size: 14,
            );
          },
          onRatingUpdate: (rating) {
            setState(() {
              ratingBar = rating;
            });
          },
        ),
        Text(
          ratingBar.toString(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.whiteColor,
                fontFamily: "Jakarta",
              ),
        ),
      ],
    );
  }
}
