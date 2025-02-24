import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uip_tv_app/screens/api_data_page/repository/user_repository.dart';
import 'package:uip_tv_app/screens/cache_data_page/cubit/cache_data_cubit.dart';
import 'package:uip_tv_app/screens/cache_data_page/cubit/network_cubit.dart';

class CacheDataScreen extends StatelessWidget {
  const CacheDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cache Data page'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NetworkCubit()),
          BlocProvider(
              create: (context) => CacheDataCubit(
                    UserRepository(),
                  )),
        ],
        child: BlocConsumer<NetworkCubit, NetworkState>(
          listener: (context, state) {
            if (state is NetworkOnline) {
              context.read<CacheDataCubit>().getApiData();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green, content: Text('Online')));
            } else {
              context.read<CacheDataCubit>().getCacheData();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.red, content: Text('Offline')));
            }
          },
          builder: (context, networkState) {
            return BlocBuilder<CacheDataCubit, CacheDataState>(
              builder: (context, state) {
                if (state is CacheDataLoaded) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.userModel.name),
                        Text(state.userModel.email),
                        Text(state.userModel.phone),
                        Text(state.userModel.website),
                        Text(state.userModel.company.name),
                        Text(state.userModel.address.street),
                        Text(state.userModel.address.suite),
                        Text(state.userModel.address.city),
                      ],
                    ),
                  );
                } else if (state is CacheDataError) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}
