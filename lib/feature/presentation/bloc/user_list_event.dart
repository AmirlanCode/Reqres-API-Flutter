import 'package:equatable/equatable.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object?> get props => [];
}

class UserListLoaded extends UserListEvent {
  const UserListLoaded();

  @override
  List<Object?> get props => [];
}
