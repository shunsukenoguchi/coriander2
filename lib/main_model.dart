import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  String text = 'おはよう';

  void changeText() {
    text = 'こんにちは';
    notifyListeners();
  }
}
