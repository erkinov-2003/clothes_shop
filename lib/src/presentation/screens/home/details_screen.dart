import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:clotheses_shop/src/data/model/card_model.dart';
import 'package:clotheses_shop/src/data/model/favorite_model.dart';
import 'package:clotheses_shop/src/presentation/dialog/card_dialog.dart';
import 'package:clotheses_shop/src/presentation/dialog/favorite_dialog.dart';
import 'package:clotheses_shop/src/presentation/widget/counter_cart.dart';
import 'package:clotheses_shop/src/presentation/widget/details_button.dart';
import 'package:clotheses_shop/src/presentation/widget/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool isLaked = true;

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.392,
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
                              height: 35,
                              color: AppColors.blackColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () => addFavoriteDialog(context, () {
                              final model = FavoriteModel(
                                title: widget.title,
                                price: widget.price,
                                images: widget.images,
                              );
                              mainController.saveFavoriteList(model);
                              Navigator.pop(context);
                            }),
                            icon: const Icon(
                              Icons.favorite_border,
                              size: 30,
                              color: Colors.red,
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
                height: size.height * 0.540,
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
                          SizedBox(height: size.height * 0.035),
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
                          SizedBox(height: size.height * 0.013),
                          const CustomStatusBar(),
                          SizedBox(height: size.height * 0.023),
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
                          SizedBox(height: size.height * 0.023),
                          const CounterCard(counterText: "1"),
                          SizedBox(height: size.height * 0.056),
                          DetailsButton(
                            outlineFunction: () => {},
                            elevatedFunction: () => addCardDialog(context, () {
                              final model = CardModel(
                                title: widget.title,
                                price: widget.price,
                                images: widget.images,
                              );
                              mainController.saveCartList(model);
                              Navigator.pop(context);
                            }),
                          ),
                          SizedBox(height: size.height * 0.033),
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
