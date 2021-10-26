import 'package:flutter/material.dart';
import 'package:geniusrecipes/utils/constants.dart';

class NutrientWidget extends StatelessWidget {
  final String name;
  final String value;

  const NutrientWidget({Key? key, required this.name, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: ((size.width - Constants.spacing * 2) / 3) - Constants.spacing / 3,
      height: 60.0,
      // margin: EdgeInsets.fromLTRB(
      //     0.0, 0.0, Constants.spacing / 3, Constants.spacing / 3),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: Constants.spacing / 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
