import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:clotheses_shop/src/presentation/widget/custom_botton.dart';
import 'package:clotheses_shop/src/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    this.switchFunction,
  });
  final void Function()? switchFunction;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                "Signup",
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
                    "Already have a account? ",
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
                      "Login",
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
                hintText: "Enter your name",
                text: "Full Name",
              ),
              const SizedBox(height: 20),
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
                bottomText: "Create Account",
                onPressed: () => {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
