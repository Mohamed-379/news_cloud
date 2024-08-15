import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String image;
  String type;
  String id;

  CategoryItem({super.key, required this.image, required this.type, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 160,
      width: MediaQuery.of(context).size.width * 0.56,
      alignment: Alignment.center,
      child: Text(
        type,
        style: const TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }

  static List<CategoryItem> categories = [
    CategoryItem(image: 'assets/business.png', type: 'Business', id: 'business',),
    CategoryItem(image: 'assets/entertaiment.avif', type: 'Entertainment', id: 'entertainment',),
    CategoryItem(image: 'assets/general.png', type: 'General', id: 'general',),
    CategoryItem(image: 'assets/health.avif', type: 'Health', id: 'health',),
    CategoryItem(image: 'assets/science.avif', type: 'Science', id: 'science',),
    CategoryItem(image: 'assets/sports.png', type: 'Sports', id: 'sport',),
    CategoryItem(image: 'assets/technology.jpeg', type: 'Technology', id: 'technology',),
  ];
}