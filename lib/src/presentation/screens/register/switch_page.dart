import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/presentation/screens/register/sign_in_screen.dart';
import 'package:clotheses_shop/src/presentation/screens/register/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchPages extends StatefulWidget {
  const SwitchPages({super.key});

  @override
  State<SwitchPages> createState() => _SwitchPagesState();
}

class _SwitchPagesState extends State<SwitchPages> {
  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    if (mainController.switchBool) {
      return SignInScreen(
        switchFunction: mainController.switchPagesButton,
      );
    } else {
      return SignUpScreen(
        switchFunction: mainController.switchPagesButton,
      );
    }
  }
}
