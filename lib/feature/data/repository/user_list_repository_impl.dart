import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:testing/common/exception.dart';
import 'package:testing/common/failure.dart';
import 'package:testing/feature/data/datasource/remote_data_source.dart';
import 'package:testing/feature/data/models/user.dart';
import 'package:testing/feature/domain/repository/user_list_repository.dart';

class UserListRepositoryImpl implements UserListRepository {
  final RemoteDataSource remoteDataSource;

  UserListRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<User>>> getUserList() async {
    try {
      final result = await remoteDataSource.getUserList();
      final getData = result.map((e) => e.toEntity()).toList();
      return Right(getData);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
