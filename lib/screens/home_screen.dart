import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geniusrecipes/utils/constants.dart';
import 'package:geniusrecipes/utils/categories_data.dart';
import 'package:geniusrecipes/widgets/buttonicon_widget.dart';
import 'package:geniusrecipes/widgets/category_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                  0.0,
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
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: Constants.spacing / 2,
                horizontal: Constants.spacing,
              ),
              sliver: SliverStaggeredGrid.countBuilder(
                crossAxisCount: 4,
                itemCount: categoriesList.length,
                itemBuilder: (context, index) => CategoryWidget(
                  title: categoriesList[index].title,
                  subtitle: categoriesList[index].subtitle,
                  preview: categoriesList[index].preview,
                  background: categoriesList[index].background,
                  color: categoriesList[index].color,
                  query: categoriesList[index].query,
                ),
                staggeredTileBuilder: (int index) => StaggeredTile.count(
                  categoriesList[index].crossAxisCellCount,
                  categoriesList[index].mainAxisCellCount,
                ),
                mainAxisSpacing: Constants.spacing / 3,
                crossAxisSpacing: Constants.spacing / 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
