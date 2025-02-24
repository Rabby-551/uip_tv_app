part of 'network_cubit.dart';

@immutable
sealed class NetworkState {}

final class NetworkUnknown extends NetworkState {}

final class NetworkOnline extends NetworkState {}

final class NetworkOffline extends NetworkState {}
