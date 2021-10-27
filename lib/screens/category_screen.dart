import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:geniusrecipes/utils/constants.dart';
import 'package:geniusrecipes/widgets/buttonicon_widget.dart';
import 'package:geniusrecipes/widgets/recipe_widget.dart';

Future<List<Data>> fetchData(query) async {
  final response = await http.get(Uri.parse(
      '${dotenv.env['API_URL']}/complexSearch?apiKey=${dotenv.env['API_KEY']}&${query}'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['results'];
    return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occurred!');
  }
}

class Data {
  final int id;
  final String title;
  final String image;

  Data({required this.id, required this.title, required this.image});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}

class CategoryScreen extends StatefulWidget {
  final arguments;
  const CategoryScreen(this.arguments, {Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Data>> futureData;
  final double kExpandedHeight = 200.0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    futureData = fetchData(widget.arguments['query']);
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
    final Size size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

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
                arguments['title'],
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(arguments['background']),
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
                        arguments['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42.0,
                          color: Constants.textColor,
                        ),
                      ),
                      Text(
                        arguments['subtitle'],
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
                vertical: Constants.spacing / 1.5,
                horizontal: Constants.spacing,
              ),
              child: FutureBuilder<List<Data>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Data>? data = snapshot.data;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'more than ${data!.length.floor()}\nrecipes',
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
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: Constants.spacing / 1.5);
                            },
                            shrinkWrap: true,
                            primary: false,
                            padding:
                                EdgeInsets.only(top: Constants.spacing / 1.5),
                            itemCount: data.length,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return RecipeWidget(
                                id: data[index].id,
                                title: data[index].title,
                                image: data[index].image,
                              );
                            }),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default show a loading spinner.
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
