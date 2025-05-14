import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class NetworkAwareWrapper extends StatefulWidget {
  final Widget child;

  const NetworkAwareWrapper({required this.child, super.key});

  @override
  State<NetworkAwareWrapper> createState() => _NetworkAwareWrapperState();
}

class _NetworkAwareWrapperState extends State<NetworkAwareWrapper> {
  late final StreamSubscription<List<ConnectivityResult>> _subscription;
  bool _wasConnected = true;

  @override
  void initState() {
    super.initState();
    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      final isConnected =
          results.any((result) => result != ConnectivityResult.none);

      if (isConnected != _wasConnected) {
        _wasConnected = isConnected;

        final message = isConnected ? 'Online' : 'No Internet Connection';
        final color = isConnected ? Colors.green : Colors.red;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: color,
                duration: Duration(seconds: 5),
              ),
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
