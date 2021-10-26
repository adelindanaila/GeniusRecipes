import 'package:flutter/material.dart';
import 'package:geniusrecipes/utils/constants.dart';
import 'package:geniusrecipes/screens/home_screen.dart';
import 'package:geniusrecipes/screens/category_screen.dart';
import 'package:geniusrecipes/screens/recipe_screen.dart';

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
        primaryColor: Constants.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Constants.textColor, fontSize: 14.0),
        ),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/category': (context) => const CategoryScreen(),
        '/recipe': (context) => const RecipeScreen(),
      },
    );
  }
}
