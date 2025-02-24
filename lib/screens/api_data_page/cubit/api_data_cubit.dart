import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uip_tv_app/screens/api_data_page/models/user_model.dart';
import 'package:uip_tv_app/screens/api_data_page/repository/user_repository.dart';

part 'api_data_state.dart';

class ApiDataCubit extends Cubit<ApiDataState> {
  ApiDataCubit(this.repository) : super(ApiDataInitial()) {
    loadUserData();
  }

  final UserRepository repository;

  Future<void> loadUserData() async {
    emit(ApiDataLoading());
    try {
      final users = await repository.fetchUserData();
      emit(ApiDataLoaded(userList: users));
    } catch (e) {
      emit(ApiDataError(errorMessage: e.toString()));
    }
  }
}
