import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos/core/provider/app/app_model.dart';
import 'package:smart_pos/ui/mainview/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AppModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart POS',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MainScreen(),
        },
      ),
    );
  }
}
