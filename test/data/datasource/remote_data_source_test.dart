import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:testing/common/constants.dart';
import 'package:testing/feature/data/datasource/remote_data_source.dart';
import 'package:testing/feature/domain/entities/user_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/mock_generator.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group(
    'get userlist model',
    () {
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/test_user_list.json'),
      );

      final data = jsonMap['data'];

      final list = [...data];
      final getData = list.map((e) => UserModel.fromJson(e)).toList();

      test(
        'should return userlist model when the response is 200',
        () async {
          when(mockHttpClient.get(Uri.parse(Urls.userList()))).thenAnswer(
            (_) async => http.Response(
              readJson('helpers/test_user_list.json'),
              200,
            ),
          );

          final result = await dataSource.getUserList();

          expect(result, equals(getData));
        },
      );
    },
  );
}
