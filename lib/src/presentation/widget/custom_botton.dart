import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    this.onPressed,
    required this.bottomText,
  });
  final void Function()? onPressed;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        backgroundColor: AppColors.bottomColor,
        fixedSize: Size(size.width * 0.918, size.height * 0.067),
      ),
      onPressed: onPressed,
      child: Text(
        bottomText,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
