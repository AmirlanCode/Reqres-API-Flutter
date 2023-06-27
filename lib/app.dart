import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/common/strings.dart';
import 'package:testing/di/injector.dart' as di;
import 'package:testing/feature/presentation/bloc/user_list_bloc.dart';
import 'package:testing/feature/presentation/screens/user_list_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.serviceLocator<UserListBloc>(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.green.shade100,
          appBar: AppBar(
            title: const Text(Strings.appBarName),
            backgroundColor: Colors.green,
          ),
          body: const UserListPage(),
        ),
      ),
    );
  }
}
