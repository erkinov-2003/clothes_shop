import 'package:flutter/material.dart';


class MainController extends ChangeNotifier {
  int index = 0;
  void onboardingButton(int value) {
    index = value;
    notifyListeners();
  }


  bool switchBool = true;

  int currentIndex = 0;

  void currentIndexFunction(int value){
    currentIndex = value;
    notifyListeners();
  }

  void switchPagesButton() {
    switchBool = !switchBool;
    notifyListeners();
  }

  bool isCollapsed = true;

  void isCollapsedFunction() {
    isCollapsed = !isCollapsed;
    notifyListeners();
  }

  void navigationPages(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
