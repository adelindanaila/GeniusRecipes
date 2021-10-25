import 'package:flutter/material.dart';
import 'package:geniusrecipes/utils/constants.dart';
import 'package:geniusrecipes/widgets/buttonicon_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final double kExpandedHeight = 200.0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() => setState(() {}));
    super.initState();
  }

  // https://stackoverflow.com/a/62137478
  double get _titleOpacity {
    if (_scrollController.hasClients) {
      if (_scrollController.offset < (kExpandedHeight / 2)) {
        // In case 50%-100% of the expanded height is viewed
        return 0; // 0
      }

      if (_scrollController.offset > (kExpandedHeight - kToolbarHeight)) {
        // In case 0% of the expanded height is viewed
        return 1;
      }

      // In case 0%-50% of the expanded height is viewed
      return 1;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: kExpandedHeight,
            backgroundColor: const Color(0xFFd4e3a5),
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _titleOpacity,
              child: Text(
                'Vegetarian',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Constants.textColor,
                ),
              ),
            ),
            centerTitle: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/category-vegetarian.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      Constants.spacing, 0.0, 0.0, Constants.spacing / 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Meat',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42.0,
                          color: Constants.textColor,
                        ),
                      ),
                      Text(
                        'love',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42.0,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Constants.spacing / 2,
                horizontal: Constants.spacing,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'more than 80\nrecipes',
                        style: TextStyle(
                          color: Constants.grayColor,
                        ),
                      ),
                      ButtonIcon(
                        image: 'assets/images/search-primary.png',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: Constants.spacing / 1.5);
                    },
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.only(top: Constants.spacing),
                    itemCount: 5,
                    itemBuilder: (ctx, i) => (Container(
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
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/vegetarian.jpeg',
                                ),
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
                          Padding(
                            padding: EdgeInsets.all(Constants.spacing / 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Chicken Hawaiian',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text('Chicken, cheese and pineapple'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
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
