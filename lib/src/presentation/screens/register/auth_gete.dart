import 'package:clotheses_shop/src/presentation/page_builder/page_builder.dart';
import 'package:clotheses_shop/src/presentation/screens/register/switch_page.dart';
import 'package:clotheses_shop/src/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: AuthService().authGateStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const PageBuilder();
          } else {
            return const SwitchPages();
          }
        },
      ),
    );
  }
}
