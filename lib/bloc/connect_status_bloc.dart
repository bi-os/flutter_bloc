import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc_example/enums/enums.dart';
import 'package:rxdart/rxdart.dart';

class NetworkStatusBloc {
  // streams
  final BehaviorSubject<ConnectivityStatus> _connectStatus =
      BehaviorSubject<ConnectivityStatus>.seeded(ConnectivityStatus.Offline);
  final BehaviorSubject<bool> _isConnected =
      BehaviorSubject<bool>.seeded(false);

  NetworkStatusBloc() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print('status changed=> $result');
      _connectStatus.add(_getStatusFromResult(result));
      _isConnected.add(_checkIsHaveConnect(result));
    });
  }
  dispose() {
    _connectStatus.close();
    _isConnected.close();
  }

  BehaviorSubject<bool> get isConnected => _isConnected;

  Future<ConnectivityResult> updateNetworkStatus() async {
    final result = await Connectivity().checkConnectivity();
    _connectStatus.add(_getStatusFromResult(result));
    _isConnected.add(_checkIsHaveConnect(result));
    return result;
  }

  bool _checkIsHaveConnect(ConnectivityResult connection) {
    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}

final networkStatusBloc = NetworkStatusBloc();
