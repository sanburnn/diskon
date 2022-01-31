import 'package:diskon/provider/provider.dart';
import 'package:diskon/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:diskon/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostDataProvider()),
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
