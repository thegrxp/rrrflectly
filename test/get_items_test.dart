import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rrrflectly/core/models/item_model.dart';
import 'package:rrrflectly/core/utils/constants.dart';
import 'package:rrrflectly/data/data_sources/items_remote_data_source.dart';

import 'get_items_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('getItems', () {
    test('returns items if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
          .get(Uri.parse('$BASE_URL/albums')))
          .thenAnswer((_) async =>
          http.Response('[{"userId": 1, "id": 2, "title": "mock"}]', 200));

      expect(await ItemsRemoteDataSourceImpl().getItems(client), isA<List<Item>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(ItemsRemoteDataSourceImpl().getItems(client), throwsException);
    });
  });
}