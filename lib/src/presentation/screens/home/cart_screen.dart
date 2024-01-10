import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/presentation/widget/card_items.dart';
import 'package:clotheses_shop/src/presentation/widget/custom_botton.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 540,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CustomCardItem();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Order Info",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Jakarta",
                      ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Jakarta",
                          ),
                    ),
                    Text(
                      "\$ 27.25",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Jakarta",
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: CustomBottom(
                  onPressed: () => {},
                  bottomText: "Checkout",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
