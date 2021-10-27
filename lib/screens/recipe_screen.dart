import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:geniusrecipes/utils/constants.dart';
import 'package:geniusrecipes/widgets/buttonicon_widget.dart';
import 'package:geniusrecipes/widgets/nutrient_widget.dart';

Future<Data> fetchData(id) async {
  final response = await http.get(Uri.parse(
      '${dotenv.env['API_URL']}/${id}/information?apiKey=${dotenv.env['API_KEY']}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body.length);
    return Data.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

class Data {
  final int id;
  final String image;
  final String title;
  final String summary;
  final int minutes;
  final List ingredients;
  final List steps;

  Data({
    required this.id,
    required this.image,
    required this.title,
    required this.summary,
    required this.minutes,
    required this.ingredients,
    required this.steps,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      summary: json['summary'],
      minutes: json['readyInMinutes'],
      ingredients: json['extendedIngredients'],
      steps: json['analyzedInstructions'],
    );
  }
}

class RecipeScreen extends StatefulWidget {
  final arguments;
  const RecipeScreen(this.arguments, {Key? key}) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late Future<Data> futureData;

  @override
  void initState() {
    futureData = fetchData(widget.arguments['id']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double kExpandedHeight = 200.0;
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

    String removeAllHtmlTags(String htmlText) {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

      return htmlText.replaceAll(exp, '');
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            bottom: PreferredSize(
              child: Container(),
              preferredSize: Size(0, Constants.spacing / 1.5),
            ),
            expandedHeight: kExpandedHeight,
            collapsedHeight: 56.0 + Constants.spacing / 2,
            elevation: 0.0,
            stretch: true,
            pinned: true,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  child: Image.network(
                    widget.arguments['image'],
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
              child: FutureBuilder<Data>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data!.steps);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(bottom: Constants.spacing / 2),
                          child: Text(
                            snapshot.data!.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                        Text(
                          removeAllHtmlTags(snapshot.data!.summary),
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
                          children: <Widget>[
                            Text(
                              '${snapshot.data!.ingredients.length} Ingredients',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${snapshot.data!.minutes} min',
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
                          padding:
                              EdgeInsets.only(top: Constants.spacing / 1.5),
                          itemCount: snapshot.data!.ingredients.length,
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
                                    margin: EdgeInsets.only(
                                        left: Constants.spacing / 3),
                                    child: Text(snapshot.data!.ingredients[i]
                                        ['originalString']),
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
                                  value: false,
                                  onChanged: (bool? value) {
                                    print(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Constants.spacing),
                        Text(
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
                          padding:
                              EdgeInsets.only(top: Constants.spacing / 1.5),
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
                                margin:
                                    EdgeInsets.only(top: Constants.spacing / 3),
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
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return SizedBox(
                    height:
                        size.height - kExpandedHeight - Constants.spacing * 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Constants.primaryColor,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
