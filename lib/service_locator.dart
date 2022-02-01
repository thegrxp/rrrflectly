import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:rrrflectly/core/network/network_info.dart';
import 'package:rrrflectly/data/data_sources/color_local_data_source.dart';
import 'package:rrrflectly/data/data_sources/items_remote_data_source.dart';
import 'package:rrrflectly/data/repositories/color_repository.dart';
import 'package:rrrflectly/data/repositories/items_repository.dart';
import 'package:rrrflectly/domain/use_cases/get_items_use_case.dart';
import 'package:rrrflectly/domain/use_cases/manage_background_color_use_case.dart';
import 'package:rrrflectly/ui/screens/home/home_viewmodel_impl.dart';
import 'package:rrrflectly/ui/screens/welcome/welcome_viewmodel_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Service locator instance
// I chose to use GetIt over Provider for a service locator because I find
// it easier to implement, maintain and read.
GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  // ViewModels
  serviceLocator.registerFactory(() => WelcomeViewModelImpl());
  serviceLocator.registerFactory(() => HomeViewModelImpl());

  // Use cases
  serviceLocator.registerLazySingleton<ManageBackgroundColorUseCase>(() => ManageBackgroundColorUseCaseImpl());
  serviceLocator.registerLazySingleton<GetItemsUseCase>(() => GetItemsUseCaseImpl());

  // Repository
  serviceLocator.registerLazySingleton<ColorRepository>(() => ColorRepositoryImpl());
  serviceLocator.registerLazySingleton<ItemsRepository>(() => ItemsRepositoryImpl());

  // Data source
  serviceLocator.registerLazySingleton<ColorLocalDataSource>(() => ColorLocalDataSourceImpl());
  serviceLocator.registerLazySingleton<ItemsRemoteDataSource>(() => ItemsRemoteDataSourceImpl());

  // Core
  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => Connectivity());
}
