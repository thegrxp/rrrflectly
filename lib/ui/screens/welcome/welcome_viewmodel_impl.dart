import 'package:flutter/material.dart';
import 'package:rrrflectly/domain/use_cases/manage_background_color_use_case.dart';
import 'package:rrrflectly/service_locator.dart';

class WelcomeViewModelImpl with ChangeNotifier implements WelcomeViewModel {
  final _manageBackgroundColorUseCase =
      serviceLocator<ManageBackgroundColorUseCase>();

  @override
  initBackgroundColor(Color defaultColor) async {
    await _manageBackgroundColorUseCase
        .initBackgroundColorValue(defaultColor.value);
  }

  @override
  setBackgroundColor(Color color) async {
    await _manageBackgroundColorUseCase.setBackgroundColorValue(color.value);
    notifyListeners();
  }

  @override
  Color getBackgroundColor() {
    final colorValue = _manageBackgroundColorUseCase.getBackgroundColorValue();
    return Color(colorValue);
  }
}

abstract class WelcomeViewModel {
  Future setBackgroundColor(Color color);

  Color getBackgroundColor();

  initBackgroundColor(Color defaultColor);
}

