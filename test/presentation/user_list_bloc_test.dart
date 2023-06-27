import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testing/common/failure.dart';
import 'package:testing/feature/data/models/user.dart';
import 'package:testing/feature/domain/usecases/get_user_list.dart';
import 'package:testing/feature/presentation/bloc/user_list_bloc.dart';
import 'package:testing/feature/presentation/bloc/user_list_event.dart';
import 'package:testing/feature/presentation/bloc/user_list_state.dart';

import 'user_list_bloc_test.mocks.dart';

@GenerateMocks([GetUserList])
void main() {
  late MockGetUserList mockGetUserList;
  late UserListBloc userListBloc;

  setUp(
    () {
      mockGetUserList = MockGetUserList();
      userListBloc = UserListBloc(mockGetUserList);
    },
  );

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

  test(
    'initial state',
    () {
      expect(userListBloc.state, UserListStateEmpty());
    },
  );

  blocTest<UserListBloc, UserListState>(
      'should emit loading and get data successfully',
      build: () {
        when(mockGetUserList.execute())
            .thenAnswer((_) async => const Right(testUserList));
        return userListBloc;
      },
      act: (bloc) => bloc.add(const UserListLoaded()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
            UserListLoading(),
            const UserListHasData(testUserList),
          ],
      verify: (bloc) {
        verify(mockGetUserList.execute());
      });

  blocTest<UserListBloc, UserListState>(
    'should emit when get data is unsuccessful',
    build: () {
      when(mockGetUserList.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server failure')));
      return userListBloc;
    },
    act: (bloc) => bloc.add(const UserListLoaded()),
    expect: () => [
      UserListLoading(),
      const UserListError('Server failure'),
    ],
    verify: (bloc) {
      verify(mockGetUserList.execute());
    },
  );
}
