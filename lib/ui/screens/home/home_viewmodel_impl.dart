import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rrrflectly/core/models/item_model.dart';
import 'package:rrrflectly/domain/use_cases/get_items_use_case.dart';
import 'package:rrrflectly/domain/use_cases/manage_background_color_use_case.dart';
import 'package:rrrflectly/service_locator.dart';

class HomeViewModelImpl with ChangeNotifier implements HomeViewModel {
  final _manageBackgroundColorUseCase =
  serviceLocator<ManageBackgroundColorUseCase>();
  final _getItemsUseCase = serviceLocator<GetItemsUseCase>();

  @override
  Color getBackgroundColor() {
    final colorValue = _manageBackgroundColorUseCase.getBackgroundColorValue();
    return Color(colorValue);
  }

  @override
  Future<Either<String, List<Item>>> getItems() async {
    return _getItemsUseCase.getItems();
  }
}

abstract class HomeViewModel {
  Color getBackgroundColor();

  Future<Either<String, List<Item>>> getItems();
}
