import 'package:flutter/material.dart';
import 'package:calendar_store/theme.dart';

class CategoryItem extends StatelessWidget {
  final String? title;
  final bool isActive;
  final Function? press;
  const CategoryItem({
    Key? key,
    this.title,
    this.isActive = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              title!,
              style: isActive
                  ? Theme.of(context).primaryTextTheme.headline5
                  : Theme.of(context).primaryTextTheme.bodyText1,
            ),
            if (isActive)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 22,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
