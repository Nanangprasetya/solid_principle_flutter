import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solid_data/solid_data.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

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
        Fluttertoast.showToast(msg: MESSAGE_UNCONNECTED, toastLength: Toast.LENGTH_SHORT);
      } else {
        Fluttertoast.showToast(msg: MESSAGE__CONNECTED, toastLength: Toast.LENGTH_SHORT);
      }
    });
  }
}
