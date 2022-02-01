import 'package:rrrflectly/data/repositories/color_repository.dart';
import 'package:rrrflectly/service_locator.dart';

class ManageBackgroundColorUseCaseImpl extends ManageBackgroundColorUseCase {
  final ColorRepository _colorRepository = serviceLocator<ColorRepository>();
  late int _colorValue;

  @override
  Future<bool> initBackgroundColorValue(int defaultColorValue) async {
    final initialColorValue = _colorRepository.getBackgroundColor();
    if (initialColorValue != null) {
      _colorValue = initialColorValue;
    } else {
      _colorValue = defaultColorValue;
    }
    return true;
  }

  @override
  Future setBackgroundColorValue(int colorValue) async {
    await _colorRepository.setBackgroundColor(colorValue);
    _colorValue = colorValue;
  }

  @override
  int getBackgroundColorValue() {
    return _colorValue;
  }
}

abstract class ManageBackgroundColorUseCase {
  Future<bool> initBackgroundColorValue(int defaultColorValue);

  int getBackgroundColorValue();

  Future setBackgroundColorValue(int colorValue);
}

