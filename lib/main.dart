import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './screens/status_scree.dart';
import './services/socket_service.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SocketService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'status',
        routes: {
          'home': (_) => HomeScreen(),
          'status': (_) => StatusScreen(),
        },
      ),
    );
  }
}
