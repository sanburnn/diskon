import 'package:diskon/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:diskon/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() => runApp(MultiProvider(
  providers: providers,
  child: App()));


  List<SingleChildWidget> providers = [
  ChangeNotifierProvider<PostDataProvider>(create: (_) => PostDataProvider()),
];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
