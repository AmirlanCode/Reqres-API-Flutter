import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/feature/presentation/bloc/user_list_bloc.dart';
import 'package:testing/feature/presentation/bloc/user_list_event.dart';
import 'package:testing/feature/presentation/bloc/user_list_state.dart';
import 'package:testing/feature/presentation/screens/widget/user_list_tile_widget.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    context.read<UserListBloc>().add(const UserListLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserListHasData) {
            return ListView.builder(
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: UserListTileWidget(
                    avatarUrl: state.result[index].avatar,
                    firstName: state.result[index].firstName,
                    email: state.result[index].email,
                  ),
                );
              },
            );
          } else if (state is UserListError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
