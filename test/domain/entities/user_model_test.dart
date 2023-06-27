import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:testing/feature/data/models/user.dart';
import 'package:testing/feature/domain/entities/user_model.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testUserListModel = [
    UserModel(
      id: 1,
      email: 'george.bluth@reqres.in',
      firstName: 'George',
      lastName: 'Bluth',
      avatar: 'https://reqres.in/img/faces/1-image.jpg',
    ),
    UserModel(
      id: 2,
      email: 'janet.weaver@reqres.in',
      firstName: 'Janet',
      lastName: 'Weaver',
      avatar: 'https://reqres.in/img/faces/2-image.jpg',
    ),
    UserModel(
      id: 3,
      email: 'emma.wong@reqres.in',
      firstName: 'Emma',
      lastName: 'Wong',
      avatar: 'https://reqres.in/img/faces/3-image.jpg',
    ),
    UserModel(
      id: 4,
      email: 'eve.holt@reqres.in',
      firstName: 'Eve',
      lastName: 'Holt',
      avatar: 'https://reqres.in/img/faces/4-image.jpg',
    ),
    UserModel(
      id: 5,
      email: 'charles.morris@reqres.in',
      firstName: 'Charles',
      lastName: 'Morris',
      avatar: 'https://reqres.in/img/faces/5-image.jpg',
    ),
    UserModel(
      id: 6,
      email: 'tracey.ramos@reqres.in',
      firstName: 'Tracey',
      lastName: 'Ramos',
      avatar: 'https://reqres.in/img/faces/6-image.jpg',
    ),
  ];

  const testUserList = [
    User(
      id: 1,
      email: 'george.bluth@reqres.in',
      firstName: 'George',
      lastName: 'Bluth',
      avatar: 'https://reqres.in/img/faces/1-image.jpg',
    ),
    User(
      id: 2,
      email: 'janet.weaver@reqres.in',
      firstName: 'Janet',
      lastName: 'Weaver',
      avatar: 'https://reqres.in/img/faces/2-image.jpg',
    ),
    User(
      id: 3,
      email: 'emma.wong@reqres.in',
      firstName: 'Emma',
      lastName: 'Wong',
      avatar: 'https://reqres.in/img/faces/3-image.jpg',
    ),
    User(
      id: 4,
      email: 'eve.holt@reqres.in',
      firstName: 'Eve',
      lastName: 'Holt',
      avatar: 'https://reqres.in/img/faces/4-image.jpg',
    ),
    User(
      id: 5,
      email: 'charles.morris@reqres.in',
      firstName: 'Charles',
      lastName: 'Morris',
      avatar: 'https://reqres.in/img/faces/5-image.jpg',
    ),
    User(
      id: 6,
      email: 'tracey.ramos@reqres.in',
      firstName: 'Tracey',
      lastName: 'Ramos',
      avatar: 'https://reqres.in/img/faces/6-image.jpg',
    ),
  ];

  group('to entity', () {
    test(
      'should be a subclass of user list entity',
      () async {
        final result = testUserListModel.map((e) => e.toEntity()).toList();

        expect(result, equals(testUserList));
      },
    );
  });

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helpers/test_user_list.json'),
        );

        final data = jsonMap['data'];

        final list = [...data];
        final getData = list.map((e) => UserModel.fromJson(e)).toList();

        expect(getData, equals(testUserListModel));
      },
    );
  });
}
