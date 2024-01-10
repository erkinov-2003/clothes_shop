import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../widget/custom_botton.dart';
import '../../widget/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
    this.switchFunction,
  });
  final void Function()? switchFunction;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppIcons.logoIcon,
                height: 40,
              ),
              const SizedBox(height: 30),
              Text(
                "Login",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.whiteColor,
                      fontFamily: "Jakarta",
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Jakarta",
                        ),
                  ),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: widget.switchFunction,
                    child: Text(
                      "Signup",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.bottomColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Jakarta",
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const CustomTextField(
                hintText: "Enter your email",
                text: "Email",
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: "Enter your password",
                text: "Password",
                suffixIcon: GestureDetector(
                  onTap: () => mainController.isCollapsedFunction,
                  child: mainController.isCollapsed
                      ? const Icon(
                          Icons.visibility_off,
                          size: 25,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.visibility,
                          size: 25,
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(height: 40),
              CustomBottom(
                bottomText: "Login",
                onPressed: () => {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
