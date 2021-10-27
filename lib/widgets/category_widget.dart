import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String preview;
  final String background;
  final Color color;
  final String query;

  const CategoryWidget({Key? key, required this.title, required this.subtitle, required this.preview, required this.background, required this.color, required this.query })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/category', arguments: {
          'title': title,
          'subtitle': subtitle,
          'background': background,
          'color': color,
          'query': query
        });
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(image: AssetImage(preview), fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
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
