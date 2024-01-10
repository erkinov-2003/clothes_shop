
import 'package:clotheses_shop/src/data/model/card_model.dart';
import 'package:flutter/material.dart';

import '../data/model/favorite_model.dart';

class MainController extends ChangeNotifier {
  final List<CardModel> _cardList = [];

  List<CardModel> get getCardList => _cardList;

  final List<FavoriteModel> _favoriteList = [];

  List<FavoriteModel> get getFavoriteList => _favoriteList;

  void saveFavoriteList(FavoriteModel favoriteModel) {
    _favoriteList.add(favoriteModel);
    notifyListeners();
  }

  void deleteCardList(int index) {
    _cardList.removeAt(index);
    notifyListeners();
  }

  void deleteFavoriteList(int index) {
    _favoriteList.removeAt(index);
    notifyListeners();
  }

  void saveCartList(CardModel cardModel) {
    _cardList.add(cardModel);
    notifyListeners();
  }

  int index = 0;
  void onboardingButton(int value) {
    index = value;
    notifyListeners();
  }

  bool switchBool = true;

  int currentIndex = 0;

  void currentIndexFunction(int value) {
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
