import 'package:flutter/cupertino.dart';
import 'package:new_cloud/ui/category_news_list_builder.dart';
import 'package:new_cloud/ui/widgets/category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: CategoryItem.categories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 1),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => CategoryNewsListView(categoryId: CategoryItem.categories[index].id),)),
            child: CategoryItem.categories[index]
          );
        },
      ),
    );
  }
}