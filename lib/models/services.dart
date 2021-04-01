import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Services with ChangeNotifier {
  bool isLoading;

  void loadingStateChanger(_isLoading) {
    isLoading = _isLoading;
    notifyListeners();
  }
}
