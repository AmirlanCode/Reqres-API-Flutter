import 'package:dartz/dartz.dart';
import 'package:testing/common/failure.dart';
import 'package:testing/feature/data/models/user.dart';
import 'package:testing/feature/domain/repository/user_list_repository.dart';

class GetUserList {
  final UserListRepository repository;

  GetUserList(this.repository);

  Future<Either<Failure, List<User>>> execute() async {
    return repository.getUserList();
  }
}
