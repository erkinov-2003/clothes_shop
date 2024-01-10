import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'counter_cart.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
                width: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Loop silicos Strong Watch",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.whiteColor,
                        fontFamily: "Jakarta",
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "\$15.25",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontFamily: "Jakarta",
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: CounterCard(counterText: "1"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
