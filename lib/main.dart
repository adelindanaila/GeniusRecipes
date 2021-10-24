import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geniusrecipes/utils/constants.dart';

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
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 135.0,
              collapsedHeight: 54.0,
              toolbarHeight: 54.0,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.fromLTRB(
                  Constants.margin,
                  0.0,
                  0.0,
                  14.0,
                ),
                centerTitle: false,
                title: Text(
                  'Good food, good mood',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Constants.textColor),
                ),
              ),
              actions: [
                Row(
                  children: [
                    Container(
                      height: 38.0,
                      width: 38.0,
                      margin: EdgeInsets.only(right: Constants.margin),
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
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            Constants.primaryColor.withOpacity(0.2),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        child: Image.asset('assets/images/heart.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  Constants.margin,
                  0.0,
                  Constants.margin,
                  Constants.margin,
                ),
                child: Column(
                  children: [
                    TextField(
                      autocorrect: false,
                      style: TextStyle(
                          fontSize: Constants.textSize,
                          fontWeight: FontWeight.w500,
                          color: Constants.textColor),
                      decoration: InputDecoration(
                        hintText: 'Find recipes by ingredients..',
                        hintStyle: TextStyle(
                            color: Constants.hintColor,
                            fontWeight: FontWeight.w500,
                            fontSize: Constants.textSize),
                        prefixIcon:
                            Image.asset('assets/images/search_grey.png'),
                        filled: true,
                        fillColor: const Color(0xFFfcfcfd),
                        contentPadding: const EdgeInsets.all(16.0),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide:
                              BorderSide(color: Color(0xFFefefef), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Constants.hintColor.withOpacity(0.5),
                              width: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: Constants.margin / 2),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 6.0),
                          height: (size.width / 2) - Constants.margin - 6.0,
                          width: (size.width / 2) - Constants.margin - 6.0,
                          child: const CategoryCard(
                            name: 'Meat',
                            image: 'assets/images/meat.jpeg',
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 6.0),
                          height: (size.width / 2) - Constants.margin - 6.0,
                          width: (size.width / 2) - Constants.margin - 6.0,
                          child: const CategoryCard(
                            name: 'Vegetarian',
                            image: 'assets/images/vegetarian.jpeg',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 12.0),
                          height: (size.width / 2) - Constants.margin - 6.0,
                          width: size.width - (Constants.margin * 2.0),
                          child: const CategoryCard(
                            name: 'Vegan',
                            image: 'assets/images/vegan.jpeg',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  0.0, 12.0, 6.0, 0.0),
                              height: (size.width / 2) - Constants.margin - 6.0,
                              width: (size.width / 2) - Constants.margin - 6.0,
                              child: const CategoryCard(
                                name: 'Fish',
                                image: 'assets/images/fish.jpeg',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  0.0, 12.0, 6.0, 0.0),
                              height: (size.width / 2) - Constants.margin - 6.0,
                              width: (size.width / 2) - Constants.margin - 6.0,
                              child: const CategoryCard(
                                name: 'Asian',
                                image: 'assets/images/asian.jpeg',
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(6.0, 12.0, 0.0, 0.0),
                          height: size.width - (Constants.margin * 2),
                          width: (size.width / 2) - Constants.margin - 6.0,
                          child: const CategoryCard(
                            name: 'Seafood',
                            image: 'assets/images/seafood.jpeg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;

  const CategoryCard({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Constants.margin,
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
    );
  }
}
