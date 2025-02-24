import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uip_tv_app/screens/api_data_page/cubit/api_data_cubit.dart';
import 'package:uip_tv_app/screens/api_data_page/repository/user_repository.dart';

class ApiDataScreen extends StatelessWidget {
  const ApiDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Data page'),
      ),
      body: BlocBuilder<ApiDataCubit, ApiDataState>(
          bloc: ApiDataCubit(UserRepository()),
          builder: (context, state) {
            if (state is ApiDataLoaded) {
              return ListView.builder(
                itemCount: state.userList.length,
                itemBuilder: (context, index) {
                  final user = state.userList[index];
                  return ListTile(
                    title: Text(
                      user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.email),
                        Text(user.phone),
                        Text('${user.address.street}, ${user.address.city}'),
                      ],
                    ),
                  );
                },
              );
            } else if (state is ApiDataError) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
