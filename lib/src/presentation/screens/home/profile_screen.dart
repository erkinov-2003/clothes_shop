import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:clotheses_shop/src/presentation/dialog/info.dart';
import 'package:clotheses_shop/src/presentation/dialog/log_out.dart';
import 'package:clotheses_shop/src/presentation/dialog/privacy_policy.dart';
import 'package:clotheses_shop/src/presentation/widget/profile_item.dart';
import 'package:clotheses_shop/src/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.blackColor,
        title: const Image(
          image: AssetImage(AppIcons.logoIcon),
          height: 40,
        ),
        actions: [
          GestureDetector(
            onTap: () => logOutDialog(context, () {
              AuthService().logOutFirebase();
              Navigator.pop(context);
            }),
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
                  SizedBox(width: size.height * 0.030),
                  Text(
                    "${authUser!.email}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.023),
            const Divider(height: 0.3, color: AppColors.whiteColor),
            SizedBox(height: size.height * 0.023),
            CustomProfileItem(
              title: "Help Center",
              images: AppIcons.infoIcon,
              onPressed: () => privacyPolicyDialog(
                context,
                () {
                  _launchUrl("https://t.me/erkinovv_dev");
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: size.height * 0.023),
            CustomProfileItem(
              title: "Info",
              images: AppIcons.infoIcon,
              onPressed: () => infoDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String uri) async {
  Uri uriLauncher = Uri.parse(uri);
  if (!await launchUrl(uriLauncher)) {
    throw Exception('Could not launch $uriLauncher');
  }
}
