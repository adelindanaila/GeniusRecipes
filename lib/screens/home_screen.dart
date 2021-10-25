import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geniusrecipes/utils/constants.dart';
import 'package:geniusrecipes/widgets/buttonicon_widget.dart';
import 'package:geniusrecipes/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  Constants.spacing,
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
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  Constants.spacing,
                  0.0,
                  Constants.spacing,
                  Constants.spacing,
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
                            Image.asset('assets/images/search-grey.png'),
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
                    SizedBox(height: Constants.spacing / 2),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: Constants.spacing / 3),
                          height: (size.width / 2) -
                              Constants.spacing -
                              (Constants.spacing / 3),
                          width: (size.width / 2) -
                              Constants.spacing -
                              (Constants.spacing / 3),
                          child: const CategoryWidget(
                            name: 'Meat',
                            image: 'assets/images/meat.jpeg',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: Constants.spacing / 3),
                          height: (size.width / 2) -
                              Constants.spacing -
                              (Constants.spacing / 3),
                          width: (size.width / 2) -
                              Constants.spacing -
                              (Constants.spacing / 3),
                          child: const CategoryWidget(
                            name: 'Vegetarian',
                            image: 'assets/images/vegetarian.jpeg',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: Constants.spacing / 2),
                          height: (size.width / 2) -
                              Constants.spacing -
                              (Constants.spacing / 3),
                          width: size.width - (Constants.spacing * 2.0),
                          child: const CategoryWidget(
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
                              margin: EdgeInsets.fromLTRB(
                                  0.0,
                                  Constants.spacing / 2,
                                  Constants.spacing / 3,
                                  0.0),
                              height: (size.width / 2) -
                                  Constants.spacing -
                                  (Constants.spacing / 3),
                              width: (size.width / 2) -
                                  Constants.spacing -
                                  (Constants.spacing / 3),
                              child: const CategoryWidget(
                                name: 'Fish',
                                image: 'assets/images/fish.jpeg',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0.0,
                                  Constants.spacing / 2,
                                  Constants.spacing / 3,
                                  0.0),
                              height: (size.width / 2) -
                                  Constants.spacing -
                                  (Constants.spacing / 3),
                              width: (size.width / 2) -
                                  Constants.spacing -
                                  (Constants.spacing / 3),
                              child: const CategoryWidget(
                                name: 'Asian',
                                image: 'assets/images/asian.jpeg',
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(Constants.spacing / 3,
                              Constants.spacing / 2, 0.0, 0.0),
                          height: size.width - (Constants.spacing * 2),
                          width: (size.width / 2) -
                              Constants.spacing -
                              (Constants.spacing / 3),
                          child: const CategoryWidget(
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
