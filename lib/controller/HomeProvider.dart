import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  bool isSearch = false;

  void getIsSearch() {
    isSearch = !isSearch;
    notifyListeners();
  }

  void clearSearch() {
    isSearch = true;
    notifyListeners();
  }
}
