import 'package:flutter/material.dart';
import 'package:calendar_store/main/screens/home/components/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Course List",
            isActive: true,
            press: () {},
          ),
          CategoryItem(
            title: "Favourites",
            press: () {},
          ),
          CategoryItem(
            title: "Importance",
            press: () {},
          ),
          CategoryItem(
            title: "Books & Slides",
            press: () {},
          ),
        ],
      ),
    );
  }
}
