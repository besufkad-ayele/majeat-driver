import 'package:flutter/material.dart';

class ButtonProvider with ChangeNotifier {
  final Map<String, ButtonState> _loadingStates = {};

  ButtonState getButtonState(String buttonKey) =>
      _loadingStates[buttonKey] ?? ButtonState.active;

  void setButtonState(String buttonKey, ButtonState state) {
    _loadingStates[buttonKey] = state;
    // Logger().i("$buttonKey set to $state");
    notifyListeners();
  }
}

enum ButtonState {
  loading,
  active,
}
