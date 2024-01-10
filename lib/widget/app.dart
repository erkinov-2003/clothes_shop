import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/presentation/page_builder/page_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
          home: PageBuilder()
        );
      },
    );
  }
}
