import 'package:dartz/dartz.dart';
import 'package:rrrflectly/core/models/item_model.dart';
import 'package:rrrflectly/core/network/network_info.dart';
import 'package:rrrflectly/data/data_sources/items_remote_data_source.dart';
import 'package:rrrflectly/service_locator.dart';
import 'package:http/http.dart' as http;

abstract class ItemsRepository {
  Future<Either<String, List<Item>>> getItems();
}

class ItemsRepositoryImpl implements ItemsRepository {
  final ItemsRemoteDataSource _itemsRemoteDataSource = serviceLocator<ItemsRemoteDataSource>();
  final NetworkInfo _networkInfo = serviceLocator<NetworkInfo>();
  // Basic and naive implementation:
  // we don't handle force refresh or auto refresh after a fixed duration.
  List<Item> cachedItems = [];

  @override
  Future<Either<String, List<Item>>> getItems() async {
    if (cachedItems.isNotEmpty) return Right(cachedItems);

    if (await _networkInfo.isConnected) {
      try {
        final List<Item> result = await _itemsRemoteDataSource.getItems(http.Client());

        for (var i in result) {
          cachedItems.add(i);
        }

        return Right(result);
      } catch (e) {
        return Left("Error: ${e.toString()}");
      }
    } else {
      return const Left("Network error");
    }
  }
}
