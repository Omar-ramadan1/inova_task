import 'package:flutter/material.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checkinternet.dart';


class ConnectionUtilProvider with ChangeNotifier {
  StreamController connectionChangeController = StreamController();
  static final Connectivity _connectivity = Connectivity();

  static void initialize() {
    InternetConnectionChecker().onStatusChange.listen((event) {
      
    });
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }

  static bool hasConnection = false;

  static void _connectionChange(ConnectivityResult result) {
    _hasInternetInternetConnectionnn();
  }

  static Future<bool> _hasInternetInternetConnectionnn() async {
    bool previousConnection = hasConnection;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (await InternetConnectionChecker().hasConnection) {
        print("internet tmammmmmmm");
        hasConnection = true;
        InternetFunction.connectionChanged(true);
      } else {
        print("internet no tmammmmmmm");
        hasConnection = false;
        InternetFunction.connectionChanged(false);
      }
    } else {
      hasConnection = false;
      InternetFunction.connectionChanged(false);
    }

    return hasConnection;
  }
}
