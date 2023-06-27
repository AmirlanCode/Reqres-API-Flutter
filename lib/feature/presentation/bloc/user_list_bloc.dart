import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/feature/domain/usecases/get_user_list.dart';
import 'package:testing/feature/presentation/bloc/user_list_event.dart';
import 'package:testing/feature/presentation/bloc/user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetUserList _getUserList;

  UserListBloc(this._getUserList) : super(UserListStateEmpty()) {
    on<UserListLoaded>(
      (event, emit) async {
        emit(UserListLoading());

        final result = await _getUserList.execute();
        result.fold(
          (failure) {
            emit(UserListError(failure.message));
          },
          (data) {
            emit(UserListHasData(data));
          },
        );
      },
    );
  }
}
