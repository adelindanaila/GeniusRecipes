import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geniusrecipes/utils/constants.dart';
import 'package:geniusrecipes/screens/home_screen.dart';
import 'package:geniusrecipes/screens/category_screen.dart';
import 'package:geniusrecipes/screens/recipe_screen.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/category':
            return MaterialPageRoute(
              builder: (context) =>
                  CategoryScreen(settings.arguments), // passing arguments
              settings: settings,
            );
          default:
            throw Exception('Unknown route');
        }
      },
      routes: {
        '/': (context) => const HomeScreen(),
        // '/category': (context) => const CategoryScreen(),
        '/recipe': (context) => const RecipeScreen(),
      },
    );
  }
}
