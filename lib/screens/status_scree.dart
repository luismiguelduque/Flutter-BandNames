import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../services/socket_service.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Text("Center"),
      ),
    );
  }
}
