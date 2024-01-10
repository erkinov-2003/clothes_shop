import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.text,
    this.suffixIcon,
    this.isCollapsed,
    required this.controller,
  });
  final String hintText;
  final String text;
  final Widget? suffixIcon;
  final bool? isCollapsed;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.whiteColor,
                fontFamily: "Jakarta",
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(height: size.height * 0.023),
        TextField(
          controller: controller,
          style: const TextStyle(color: AppColors.whiteColor),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            isCollapsed: isCollapsed,
            hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide(
                color: AppColors.bottomColor,
                width: 0.8,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide(
                color: AppColors.bottomColor,
                width: 0.8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
