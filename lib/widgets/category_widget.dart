import 'package:flutter/material.dart';
import 'package:geniusrecipes/utils/constants.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final String image;

  const CategoryWidget({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/category');
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Constants.spacing,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: const Offset(0.0, 2.0),
                  blurRadius: 8.0,
                  color: Colors.black.withOpacity(0.8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
