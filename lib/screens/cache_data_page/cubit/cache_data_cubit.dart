import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uip_tv_app/main.dart';
import 'package:uip_tv_app/screens/api_data_page/models/user_model.dart';

import 'package:uip_tv_app/screens/api_data_page/repository/user_repository.dart';

part 'cache_data_state.dart';

class CacheDataCubit extends Cubit<CacheDataState> {
  CacheDataCubit(this.userRepository) : super(CacheDataInitial());

  final UserRepository userRepository;

  Future<void> getApiData() async {
    emit(CacheDataLoading());
    try {
      final user = await userRepository.fetchSingleUserData();
      emit(CacheDataLoaded(userModel: user));

      HiveManager().saveUser(user);
    } catch (e) {
      emit(CacheDataError(errorMessage: e.toString()));
    }
  }

  Future<void> getCacheData() async {
    emit(CacheDataLoading());
    try {
      final user = HiveManager().getUser();
      emit(CacheDataLoaded(userModel: user!));
    } catch (e) {
      emit(CacheDataError(errorMessage: e.toString()));
    }
  }
}
