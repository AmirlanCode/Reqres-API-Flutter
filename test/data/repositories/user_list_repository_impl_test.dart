import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:testing/common/exception.dart';
import 'package:testing/common/failure.dart';
import 'package:testing/feature/data/models/user.dart';
import 'package:testing/feature/data/repository/user_list_repository_impl.dart';
import 'package:testing/feature/domain/entities/user_model.dart';

import '../../helpers/mock_generator.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late UserListRepositoryImpl repository;

  setUp(
    () {
      mockRemoteDataSource = MockRemoteDataSource();
      repository = UserListRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
      );
    },
  );

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

  group('get userlist ', () {
    test(
      'should return user list ',
      () async {
        when(mockRemoteDataSource.getUserList())
            .thenAnswer((_) async => testUserListModel);

        final result = await repository.getUserList();

        result.fold(
          (left) => fail('user list fail'),
          (right) {
            verify(mockRemoteDataSource.getUserList());
            expect(right, equals((testUserList)));
          },
        );
      },
    );

    test(
      'should return failure',
      () async {
        when(mockRemoteDataSource.getUserList()).thenThrow(ServerException());

        final result = await repository.getUserList();
        verify(mockRemoteDataSource.getUserList());
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );
  });
}
