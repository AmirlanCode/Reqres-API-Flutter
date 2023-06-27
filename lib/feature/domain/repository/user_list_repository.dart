import 'package:dartz/dartz.dart';
import 'package:testing/common/failure.dart';
import 'package:testing/feature/data/models/user.dart';

abstract class UserListRepository {
  Future<Either<Failure, List<User>>> getUserList();
}
