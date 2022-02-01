import 'package:rrrflectly/data/data_sources/color_local_data_source.dart';
import 'package:rrrflectly/service_locator.dart';

abstract class ColorRepository {
  Future setBackgroundColor(int colorValue);

  int? getBackgroundColor();
}

class ColorRepositoryImpl implements ColorRepository {
  final ColorLocalDataSource _colorLocalDataSource = serviceLocator<ColorLocalDataSource>();

  @override
  int? getBackgroundColor() {
    return _colorLocalDataSource.getBackgroundColor();
  }

  @override
  Future setBackgroundColor(int colorValue) async {
    await _colorLocalDataSource.setBackgroundColor(colorValue);
  }
}
