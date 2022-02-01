import 'package:rrrflectly/core/utils/constants.dart';
import 'package:rrrflectly/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ColorLocalDataSource {
  Future setBackgroundColor(int colorValue);

  int? getBackgroundColor();
}

class ColorLocalDataSourceImpl implements ColorLocalDataSource {
  final SharedPreferences _sharedPreferences = serviceLocator<SharedPreferences>();

  @override
  int? getBackgroundColor() {
    return _sharedPreferences.getInt(SHARED_PREF_BACKGROUND_COLOR);
  }

  @override
  Future setBackgroundColor(int colorValue) async {
    await _sharedPreferences.setInt(SHARED_PREF_BACKGROUND_COLOR, colorValue);
  }
}
