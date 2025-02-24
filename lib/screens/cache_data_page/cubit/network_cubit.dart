import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit() : super(NetworkUnknown()) {
    monitorNetwork();
  }
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription<List<ConnectivityResult>> subscription;

  void monitorNetwork() {
    subscription =
        _connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        emit(NetworkOnline());
      } else {
        emit(NetworkOffline());
      }
    });
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
