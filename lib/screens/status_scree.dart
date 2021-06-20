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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Server status: ${socketService.serverStatus}")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketService.socket.emit("message-flutter", {"name": "Luis", "message": "this is the message!"});
        },
      ),
    );
  }
}
