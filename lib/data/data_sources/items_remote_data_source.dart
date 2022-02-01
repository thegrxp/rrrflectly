import 'dart:io';

import 'package:rrrflectly/core/models/item_model.dart';
import 'package:http/http.dart' as http;
import 'package:rrrflectly/core/utils/constants.dart';

abstract class ItemsRemoteDataSource {
  Future<List<Item>> getItems(http.Client client);
}

class ItemsRemoteDataSourceImpl implements ItemsRemoteDataSource {
  @override
  Future<List<Item>> getItems(http.Client httpClient) async {
    try {
      var response = await httpClient.get(
        Uri.parse('$BASE_URL/albums'),
      );

      if (response.statusCode == HttpStatus.ok) {
        httpClient.close();
        return itemFromJson(response.body);
      } else {
        httpClient.close();
        throw Exception(response.statusCode);
      }
    } catch (e) {
      httpClient.close();
      throw Exception(e);
    }
  }
}
