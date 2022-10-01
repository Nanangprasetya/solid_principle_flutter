import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/core.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  late bool _isInit = false;

  NetworkInfoImpl(this.connectivity) {
    observeNetwork();
  }

  @override
  Future<bool> get isConnected async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) return false;
    return true;
  }

  Future<void> observeNetwork() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        if (_isInit) {
          Fluttertoast.showToast(msg: MESSAGE_UNCONNECTED, toastLength: Toast.LENGTH_SHORT);
        }
      } else {
        _isInit = false;
        Fluttertoast.showToast(msg: MESSAGE__CONNECTED, toastLength: Toast.LENGTH_SHORT);
      }
    });
  }
}
