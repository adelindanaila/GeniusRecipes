import 'package:flutter/material.dart';
import 'package:geniusrecipes/utils/constants.dart';
import 'package:geniusrecipes/widgets/buttonicon_widget.dart';
import 'package:geniusrecipes/widgets/nutrient_widget.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color getCheckboxColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Constants.textColor;
      }
      return Constants.primaryColor;
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            bottom: PreferredSize(
              child: Container(),
              preferredSize: Size(0, Constants.spacing / 1.5),
            ),
            expandedHeight: 200.0,
            collapsedHeight: 56.0 + Constants.spacing / 2,
            elevation: 0.0,
            stretch: true,
            pinned: true,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    "assets/images/vegetarian.jpeg",
                    fit: BoxFit.cover,
                  ),
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: Container(
                    height: Constants.spacing,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
              ],
            ),
            leading: Row(
              children: [
                ButtonIcon(
                  image: 'assets/images/chevron-left.png',
                  margin: EdgeInsets.only(left: Constants.spacing),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            leadingWidth: 38.0 + Constants.spacing,
            actions: [
              Row(
                children: [
                  ButtonIcon(
                    image: 'assets/images/heart.png',
                    margin: EdgeInsets.only(right: Constants.spacing),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(Constants.spacing, 0.0,
                  Constants.spacing, Constants.spacing / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ground Beef Tacos',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28.0,
                    ),
                  ),
                  Text(
                    'Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder.',
                    style: TextStyle(color: Constants.grayColor),
                  ),
                  SizedBox(height: Constants.spacing),
                  const Text(
                    'Nutritional Information',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: Constants.spacing / 2),
                  Wrap(
                    spacing: Constants.spacing / 3,
                    runSpacing: Constants.spacing / 3,
                    children: const [
                      NutrientWidget(name: 'Calories', value: '582'),
                      NutrientWidget(name: 'Fat', value: '32g'),
                      NutrientWidget(name: 'Protein', value: '35g'),
                      NutrientWidget(name: 'Sodium', value: '742mg'),
                      NutrientWidget(name: 'Sugar', value: '8g'),
                      NutrientWidget(name: 'Carbs', value: '36g'),
                    ],
                  ),
                  SizedBox(height: Constants.spacing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        '3 Ingredients',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        '25 min',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: Constants.spacing / 2);
                    },
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.only(top: Constants.spacing / 1.5),
                    itemCount: 3,
                    itemBuilder: (ctx, i) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${i + 1}.',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: Constants.spacing / 3),
                              child: const Text('1 tbsp olive oil'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Constants.spacing,
                          width: Constants.spacing,
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(
                              getCheckboxColor,
                            ),
                            shape: const CircleBorder(),
                            value: true,
                            onChanged: (bool? value) {
                              print(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Constants.spacing),
                  const Text(
                    '4 Method Steps',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: Constants.spacing / 2);
                    },
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.only(top: Constants.spacing / 1.5),
                    itemCount: 3,
                    itemBuilder: (ctx, i) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Step ${i + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Constants.spacing / 3),
                          child: Text(
                            'Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder.',
                            style: TextStyle(
                              color: Constants.grayColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
