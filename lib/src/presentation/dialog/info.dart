import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Future infoDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColors.blackColor, width: 0.2),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        title: Text(
          "Bu applicationda siz ozingizga yoqgan narsani hozircha sotib ololmaysiz! Textnik ishlar olib borilmoqda. Tez orada kamchiliklar togirlanadi",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
            fontFamily: "Jakarta",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Okey",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blueColor,
                fontFamily: "Jakarta",
              ),
            ),
          ),
        ],
      );
    },
  );
}
