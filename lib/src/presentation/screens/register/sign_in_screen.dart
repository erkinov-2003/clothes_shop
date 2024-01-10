import 'package:clotheses_shop/src/services/auth_service.dart';
import 'package:flutter/material.dart';

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
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signInFirebaseButton() async {
    final service = AuthService();
    try {
      await service.signInFirebase(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      throw Exception("Error firebase login buttons");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppIcons.logoIcon,
                  height: 40,
                ),
                SizedBox(height: size.height * 0.033),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.whiteColor,
                        fontFamily: "Jakarta",
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: size.height * 0.023),
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
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.bottomColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Jakarta",
                                ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.053),
                CustomTextField(
                  hintText: "Enter your email",
                  text: "Email",
                  controller: emailController,
                ),
                SizedBox(height: size.height * 0.023),
                CustomTextField(
                  hintText: "Enter your password",
                  text: "Password",
                  controller: passwordController,
                ),
                SizedBox(height: size.height * 0.043),
                CustomBottom(
                  bottomText: "Login",
                  onPressed: signInFirebaseButton,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
