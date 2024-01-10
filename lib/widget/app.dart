import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/presentation/screens/home/onboarding_screen.dart';
import 'package:clotheses_shop/src/presentation/screens/register/sign_in_screen.dart';
import 'package:clotheses_shop/src/presentation/screens/register/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/presentation/screens/home/home_screen.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      builder: (context, child) {
        return  MaterialApp(
          theme: ThemeData(useMaterial3: false),
          title: "Clotheses app",
          debugShowCheckedModeBanner: false,
          home: OnboardingScreen(),
        );
      },
    );
  }
}
