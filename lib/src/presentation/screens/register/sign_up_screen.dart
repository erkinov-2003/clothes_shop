import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:clotheses_shop/src/core/constants/app_icons.dart';
import 'package:clotheses_shop/src/core/validator/sign_up_validor.dart';
import 'package:clotheses_shop/src/presentation/widget/custom_botton.dart';
import 'package:clotheses_shop/src/presentation/widget/custom_text_field.dart';
import 'package:clotheses_shop/src/services/auth_service.dart';
import 'package:flutter/material.dart';

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
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUpFirebaseButton() async {
    final service = AuthService();
    try {
      await service.signUpFirebase(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } catch (e) {
      throw Exception("Error firebase sign up buttons");
    }
  }

  final globalKey = GlobalKey<FormState>();

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
            child: Form(
              key: globalKey,
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
                    "Signup",
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
                        "Already have a account? ",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
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
                  SizedBox(height: size.height * 0.056),
                  CustomTextField(
                    hintText: "Enter your name",
                    text: "Full Name",
                    controller: fullNameController,
                    validator: (p0) {
                      if (p0!.isNotEmpty) {
                        return null;
                      } else {
                        return "Iltimos name bo'sh qoldirmang!";
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.023),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    text: "Email",
                    validator: (value) =>
                        SignUpValidation.emailValidation(value!),
                  ),
                  SizedBox(height: size.height * 0.023),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    text: "Password",
                    validator: (value) =>
                        SignUpValidation.passwrodValidation(value!),
                  ),
                  SizedBox(height: size.height * 0.043),
                  CustomBottom(
                    bottomText: "Create Account",
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        signUpFirebaseButton();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Error now validate!"),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
