import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing/common/constants.dart';
import 'package:testing/feature/domain/entities/user_model.dart';

abstract class RemoteDataSource {
  Future<List<UserModel>> getUserList();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUserList() async {
    final response = await client.get(Uri.parse(Urls.userList()));

    Map<String, dynamic> jsonMap = json.decode(response.body);

    print(jsonMap);

    if (response.statusCode == 200) {
      final data = jsonMap['data'];
      final list = [...data];
      final getData = list.map((e) => UserModel.fromJson(e)).toList();

      return getData;
    } else {
      throw Exception();
    }
  }
}
