import 'package:flutter/material.dart';

void main() {
  runApp(const GeniusRecipes());
}

class GeniusRecipes extends StatelessWidget {
  const GeniusRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GeniusRecipes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Inter',
            primaryColor: const Color(0xFFfe724c),
            textTheme: const TextTheme(
                bodyText2:
                    TextStyle(color: Color(0xFF1a1d26), fontSize: 14.0))),
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Hello World!')));
  }
}
