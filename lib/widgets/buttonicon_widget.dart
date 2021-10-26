import 'package:flutter/material.dart';
import 'package:geniusrecipes/utils/constants.dart';

class ButtonIcon extends StatelessWidget {
  final String image;
  final EdgeInsetsGeometry margin;
  final void Function() onPressed;

  const ButtonIcon(
      {Key? key,
      required this.image,
      this.margin = EdgeInsets.zero,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      width: 38.0,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Constants.shadowColor.withOpacity(0.5),
            spreadRadius: 0.0,
            blurRadius: 5,
            offset: const Offset(2.5, 2.5),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            Constants.primaryColor.withOpacity(0.2),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
