import 'package:flutter/cupertino.dart';
import 'package:nihon_shinbun/constants/route.dart';

class MainPageContextProvider with ChangeNotifier {
  MainPageNestedRoute _currentRoute = MainPageNestedRoute.articles;

  MainPageNestedRoute get getCurrentRoute => _currentRoute;

  void changeRoute(MainPageNestedRoute newRoute) {
    _currentRoute = newRoute;
    notifyListeners();
  }
}
