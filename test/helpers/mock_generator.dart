import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:testing/feature/data/datasource/remote_data_source.dart';
import 'package:testing/feature/domain/repository/user_list_repository.dart';

@GenerateMocks([
  UserListRepository,
  RemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}
