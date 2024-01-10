import 'package:clotheses_shop/src/data/model/card_model.dart';
import 'package:clotheses_shop/src/data/model/product_model.dart';
import 'package:flutter/material.dart';

import '../data/model/favorite_model.dart';

class MainController extends ChangeNotifier {
  final List<CardModel> _cardList = [];

  List<CardModel> get getCardList => _cardList;

  final List<FavoriteModel> _favoriteList = [];

  List<FavoriteModel> get getFavoriteList => _favoriteList;

  int count = 1;

  void incrementCounter() {
    count++;
    notifyListeners();
  }

  int totalPrice = 0;

  void clearTotalPrice() {
    for(var products in getCardList){
      final productParse = int.tryParse(products.price.replaceFirst("\$", ""));
      if(productParse != null){
        totalPrice -= productParse;
      }
      notifyListeners();
    }
  }

  void productTotalPrice() {
    for (var product in getCardList) {
      var productParse = int.tryParse(product.price.replaceFirst("\$", ""));
      if(productParse != null){
        totalPrice += productParse;
      }
    }
    notifyListeners();
  }

  void decrementCounter() {
    count--;
    if (count < 0) {
      count = 0;
    }
    notifyListeners();
  }

  void saveAllCounterData(CardModel cardModel, int index) {
    for (int i = 0; i < index; i++) {
      _cardList.add(cardModel);
      notifyListeners();
    }
  }

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
