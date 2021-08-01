import 'package:flutter/material.dart';
import 'package:calendar_store/main/components/search_box.dart';
import 'package:calendar_store/main/screens/home/components/category_list.dart';
import 'package:calendar_store/main/screens/home/components/discount_card.dart';
import 'package:calendar_store/main/screens/home/components/item_list.dart';
import 'package:calendar_store/calendar/calendar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          CategoryList(),
          ItemList(),
          DiscountCard(),
        ],
      ),
    );
  }
}
