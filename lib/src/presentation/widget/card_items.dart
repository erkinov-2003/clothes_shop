import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import 'counter_cart.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({
    super.key,
    required this.title,
    required this.price,
    required this.images,
    required this.index,
  });
  final String title;
  final String price;
  final String images;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainController = Provider.of<MainController>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.112,
            width: size.width * 0.255,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(width: size.width * 0.030),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.whiteColor,
                        fontFamily: "Jakarta",
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: size.height * 0.011),
                Text(
                  price,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.greenColor,
                        fontFamily: "Jakarta",
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: CounterCard(counterText: "1"),
                      ),
                      GestureDetector(
                        onTap: () {
                          mainController.deleteCardList(index);
                          mainController.clearTotalPrice();
                        },
                        child: const Icon(
                          Icons.clear,
                          size: 25,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
