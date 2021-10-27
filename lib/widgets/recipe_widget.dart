import 'package:flutter/material.dart';
import 'package:geniusrecipes/utils/constants.dart';
import 'package:geniusrecipes/widgets/buttonicon_widget.dart';

class RecipeWidget extends StatelessWidget {
  final int id;
  final String title;
  final String image;

  const RecipeWidget(
      {Key? key, required this.id, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/recipe', arguments: {
          'id': id,
          'image': image,
        });
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: (Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Constants.shadowColor.withOpacity(0.5),
              spreadRadius: 0.0,
              blurRadius: 5,
              offset: const Offset(2.5, 2.5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0.0,
                          Constants.spacing / 2,
                          Constants.spacing / 2,
                          0.0,
                        ),
                        child: ButtonIcon(
                          image: 'assets/images/heart.png',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(Constants.spacing),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: Constants.textColor,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
