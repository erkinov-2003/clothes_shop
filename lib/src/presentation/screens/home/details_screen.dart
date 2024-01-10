import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:clotheses_shop/src/presentation/widget/counter_cart.dart';
import 'package:clotheses_shop/src/presentation/widget/details_button.dart';
import 'package:clotheses_shop/src/presentation/widget/status_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.images,
    required this.title,
    required this.price,
    required this.description,
  });
  final String images;
  final String title;
  final String price;
  final String description;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double ratingNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.images),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Image(
                              image: AssetImage(AppIcons.arrowLeft),
                              height: 30,
                              color: AppColors.blackColor,
                            ),
                          ),
                          GestureDetector(
                            child: SizedBox(
                              height: 30,
                              width: 40,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                    width: 0.4,
                                  ),
                                ),
                                child: const Center(
                                  child: Image(
                                    image: AssetImage(AppIcons.favoriteIcon),
                                    height: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 480,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text(
                                    widget.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: AppColors.whiteColor,
                                          fontFamily: "Jakarta",
                                          fontWeight: FontWeight.w600,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Text(
                                widget.price,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: AppColors.whiteColor,
                                      fontFamily: "Jakarta",
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Text(
                            widget.description,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.greyColor,
                                  fontFamily: "Jakarta",
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 10),
                          const CustomStatusBar(),
                          const SizedBox(height: 20),
                          Text(
                            "Quanity",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.whiteColor,
                                  fontFamily: "Jakarta",
                                ),
                          ),
                          const SizedBox(height: 20),
                          const CounterCard(counterText: "1"),
                          const SizedBox(height: 50),
                          DetailsButton(
                            outlineFunction: () => {},
                            elevatedFunction: () => {},
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
