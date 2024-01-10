import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:clotheses_shop/src/presentation/widget/profile_item.dart';
import 'package:clotheses_shop/src/services/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blackColor,
        title: const Image(
          image: AssetImage(AppIcons.logoIcon),
          height: 40,
        ),
        actions: [
          GestureDetector(
            onTap: () => AuthService().logOutFirebase(),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(AppIcons.logOutIcon, height: 25),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Text(
                "Personal information",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(AppIcons.emailIcon),
                    height: 24,
                    color: AppColors.greyColor,
                  ),
                  const SizedBox(width: 24),
                  Text(
                    "azizbek@gmai.com",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(height: 0.3, color: AppColors.whiteColor),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Text(
                "Support & Information",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const CustomProfileItem(
              images: AppIcons.privacyPolicy,
              title: "Privacy Policy",
            ),
            const SizedBox(height: 20),
            const CustomProfileItem(
              title: "Info",
              images: AppIcons.infoIcon,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
