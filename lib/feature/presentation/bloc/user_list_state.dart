import 'package:equatable/equatable.dart';
import 'package:testing/feature/data/models/user.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object?> get props => [];
}

class UserListStateEmpty extends UserListState {}

class UserListLoading extends UserListState {}

class UserListError extends UserListState {
  final String message;

  const UserListError(this.message);

  @override
  List<Object?> get props => [message];
}

class UserListHasData extends UserListState {
  final List<User> result;

  const UserListHasData(this.result);

  @override
  List<Object?> get props => [result];
}
