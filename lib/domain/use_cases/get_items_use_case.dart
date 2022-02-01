import 'package:dartz/dartz.dart';
import 'package:rrrflectly/core/models/item_model.dart';
import 'package:rrrflectly/data/repositories/items_repository.dart';
import 'package:rrrflectly/service_locator.dart';

class GetItemsUseCaseImpl extends GetItemsUseCase {
  final ItemsRepository _itemsRepository = serviceLocator<ItemsRepository>();

  @override
  Future<Either<String, List<Item>>> getItems() {
    return _itemsRepository.getItems();
  }
}

abstract class GetItemsUseCase {
  Future<Either<String, List<Item>>> getItems();
}
