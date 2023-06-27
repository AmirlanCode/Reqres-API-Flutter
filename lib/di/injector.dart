import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:testing/feature/data/datasource/remote_data_source.dart';
import 'package:testing/feature/data/repository/user_list_repository_impl.dart';
import 'package:testing/feature/domain/repository/user_list_repository.dart';
import 'package:testing/feature/domain/usecases/get_user_list.dart';
import 'package:testing/feature/presentation/bloc/user_list_bloc.dart';

final serviceLocator = GetIt.I;

void init() {
  serviceLocator.registerFactory(() => UserListBloc(serviceLocator()));

  serviceLocator.registerLazySingleton(() => GetUserList(serviceLocator()));

  serviceLocator.registerLazySingleton<UserListRepository>(
    () => UserListRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(() => http.Client());
}
