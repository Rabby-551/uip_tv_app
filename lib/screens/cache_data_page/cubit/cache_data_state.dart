part of 'cache_data_cubit.dart';

@immutable
sealed class CacheDataState {}

final class CacheDataInitial extends CacheDataState {}

final class CacheDataLoading extends CacheDataState {}

final class CacheDataLoaded extends CacheDataState {
  final UserListModel userModel;
  CacheDataLoaded({required this.userModel});
}

final class CacheDataError extends CacheDataState {
  final String errorMessage;
  CacheDataError({required this.errorMessage});
}
