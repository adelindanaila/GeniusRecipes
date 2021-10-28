import 'package:flutter/material.dart';

class CategoriesData {
  final String title;
  final String subtitle;
  final String preview;
  final String background;
  final Color color;
  final String query;
  final int crossAxisCellCount;
  final double mainAxisCellCount;

  const CategoriesData({
    required this.title,
    required this.subtitle,
    required this.preview,
    required this.background,
    required this.color,
    required this.query,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
  });
}

const categoriesList = [
  CategoriesData(
    title: "Main Course",
    subtitle: "love",
    preview: "assets/images/categories/previews/main-course.jpg",
    background: "assets/images/categories/backgrounds/main-course.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "type=main course",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Side Dish",
    subtitle: "love",
    preview: "assets/images/categories/previews/side-dish.jpg",
    background: "assets/images/categories/backgrounds/side-dish.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "type=side dish",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Breakfast",
    subtitle: "love",
    preview: "assets/images/categories/previews/breakfast.jpg",
    background: "assets/images/categories/backgrounds/breakfast.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "type=breakfast",
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Dessert",
    subtitle: "love",
    preview: "assets/images/categories/previews/dessert.jpg",
    background: "assets/images/categories/backgrounds/dessert.jpg",
    color: Color.fromRGBO(243, 236, 201, 1),
    query: "type=dessert",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Salad",
    subtitle: "love",
    preview: "assets/images/categories/previews/salad.jpg",
    background: "assets/images/categories/backgrounds/salad.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "type=salad",
    crossAxisCellCount: 2,
    mainAxisCellCount: 4,
  ),
  CategoriesData(
    title: "Soup",
    subtitle: "love",
    preview: "assets/images/categories/previews/soup.jpg",
    background: "assets/images/categories/backgrounds/soup.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "type=soup",
    crossAxisCellCount: 2,
    mainAxisCellCount: 4,
  ),
  CategoriesData(
    title: "Vegetarian",
    subtitle: "love",
    preview: "assets/images/categories/previews/vegetarian.jpg",
    background: "assets/images/categories/backgrounds/vegetarian.jpeg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "diet=vegetarian",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Vegan",
    subtitle: "love",
    preview: "assets/images/categories/previews/vegan.jpg",
    background: "assets/images/categories/backgrounds/vegan.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "diet=vegan",
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Ketogenic",
    subtitle: "love",
    preview: "assets/images/categories/previews/ketogenic.jpg",
    background: "assets/images/categories/backgrounds/ketogenic.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "diet=ketogenic",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Gluten Free",
    subtitle: "love",
    preview: "assets/images/categories/previews/gluten-free.jpg",
    background: "assets/images/categories/backgrounds/gluten-free.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "diet=gluten free",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Mediterranean",
    subtitle: "love",
    preview: "assets/images/categories/previews/mediterranean.jpg",
    background: "assets/images/categories/backgrounds/mediterranean.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=mediterranean",
    crossAxisCellCount: 2,
    mainAxisCellCount: 4,
  ),
  CategoriesData(
    title: "Middle Eastern",
    subtitle: "love",
    preview: "assets/images/categories/previews/middle-eastern.jpg",
    background: "assets/images/categories/backgrounds/middle-eastern.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=middle eastern",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Italian",
    subtitle: "love",
    preview: "assets/images/categories/previews/italian.jpg",
    background: "assets/images/categories/backgrounds/italian.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=italian",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Chinese",
    subtitle: "love",
    preview: "assets/images/categories/previews/chinese.jpg",
    background: "assets/images/categories/backgrounds/chinese.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=chinese",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "French",
    subtitle: "love",
    preview: "assets/images/categories/previews/french.jpg",
    background: "assets/images/categories/backgrounds/french.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=french",
    crossAxisCellCount: 2,
    mainAxisCellCount: 4,
  ),
  CategoriesData(
    title: "Spanish",
    subtitle: "love",
    preview: "assets/images/categories/previews/spanish.jpg",
    background: "assets/images/categories/backgrounds/spanish.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=spanish",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Japanese",
    subtitle: "love",
    preview: "assets/images/categories/previews/japanese.jpg",
    background: "assets/images/categories/backgrounds/japanese.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=japanese",
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Indian",
    subtitle: "love",
    preview: "assets/images/categories/previews/indian.jpg",
    background: "assets/images/categories/backgrounds/indian.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=indian",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Greek",
    subtitle: "love",
    preview: "assets/images/categories/previews/greek.jpg",
    background: "assets/images/categories/backgrounds/greek.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=greek",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Thai",
    subtitle: "love",
    preview: "assets/images/categories/previews/thai.jpg",
    background: "assets/images/categories/backgrounds/thai.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=thai",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Mexican",
    subtitle: "love",
    preview: "assets/images/categories/previews/mexican.jpg",
    background: "assets/images/categories/backgrounds/mexican.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=mexican",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "American",
    subtitle: "love",
    preview: "assets/images/categories/previews/american.jpg",
    background: "assets/images/categories/backgrounds/american.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=american",
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Caribbean",
    subtitle: "love",
    preview: "assets/images/categories/previews/caribbean.jpg",
    background: "assets/images/categories/backgrounds/caribbean.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=caribbean",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  ),
  CategoriesData(
    title: "Eastern European",
    subtitle: "love",
    preview: "assets/images/categories/previews/eastern-european.jpg",
    background: "assets/images/categories/backgrounds/eastern-european.jpg",
    color: Color.fromRGBO(112, 95, 124, 1),
    query: "cuisine=eastern european",
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
  )
];
