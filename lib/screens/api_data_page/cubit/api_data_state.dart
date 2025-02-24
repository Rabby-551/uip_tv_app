part of 'api_data_cubit.dart';

@immutable
sealed class ApiDataState {}

final class ApiDataInitial extends ApiDataState {}

final class ApiDataLoading extends ApiDataState {}

final class ApiDataLoaded extends ApiDataState {
  final List<UserListModel> userList;

  ApiDataLoaded({required this.userList});
}

final class ApiDataError extends ApiDataState {
  final String errorMessage;

  ApiDataError({required this.errorMessage});
}
