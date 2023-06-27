import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:testing/feature/data/models/user.dart';
import 'package:testing/feature/domain/usecases/get_user_list.dart';

import '../../helpers/mock_generator.mocks.dart';

void main() {
  late MockUserListRepository mockUserListRepository;
  late GetUserList usecase;

  setUp(() {
    mockUserListRepository = MockUserListRepository();
    usecase = GetUserList(mockUserListRepository);
  });

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

  test('should get current weather detail from the repository', () async {
    // arrange
    when(mockUserListRepository.getUserList())
        .thenAnswer((_) async => const Right(testUserList));
  });
}
